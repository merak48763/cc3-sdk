from enum import StrEnum, auto
from hashlib import md5
from typing import Annotated, Any

from beet import Context, EnchantmentTag, Function, FunctionTag, configurable
from pydantic import AfterValidator, BaseModel, BeforeValidator, GetCoreSchemaHandler
from pydantic_core import CoreSchema, core_schema


class Identifier:
  namespace: str
  path: list[str]

  def __init__(self, namespace: str, path: list[str]):
    self.namespace = namespace
    self.path = path

  def __str__(self):
    return self.namespace + ":" + "/".join(self.path)

  def __repr__(self):
    return repr(str(self))

  def resolve_against(self, root: str | Identifier):
    if isinstance(root, str):
      root_path = root.split("/")
      if root_path[-1] == "":
        del root_path[-1]
      return Identifier(self.namespace, [*root_path, *self.path])
    else:
      root_path = root.path.copy()
      if root_path[-1] == "":
        del root_path[-1]
      return Identifier(root.namespace, [*root_path, self.namespace, *self.path])

  def flatten(self, prefix: str | None = None, suffix: str | None = None, *, delim="/"):
    key_prefix = (prefix,) if prefix is not None else ()
    key_suffix = (suffix,) if suffix is not None else ()
    return delim.join((*key_prefix, self.namespace, *self.path, *key_suffix))

  def to_lang_key(self, prefix: str | None = None, suffix: str | None = None):
    return self.flatten(prefix, suffix, delim=".")

  def __eq__(self, other: object):
    if not isinstance(other, Identifier):
      return False
    if self.namespace != other.namespace:
      return False
    return self.path == other.path

  def __truediv__(self, path: str):
    return Identifier(self.namespace, [*self.path, *path.split("/")])

  def __hash__(self) -> int:
    return hash(str(self))

  @classmethod
  def of(cls, value: str | Identifier):
    if isinstance(value, Identifier):
      return value
    parts = value.split(":", 1)
    if len(parts) == 1:
      namespace = "minecraft"
      path = parts[0].split("/")
    elif parts[0] == "":
      namespace = "minecraft"
      path = parts[1].split("/")
    else:
      namespace = parts[0]
      path = parts[1].split("/")
    return Identifier(namespace, path)

  @classmethod
  def __get_pydantic_core_schema__(
    cls,
    source_type: Any,
    handler: GetCoreSchemaHandler,
  ) -> CoreSchema:
    return core_schema.no_info_after_validator_function(
      cls.of,
      core_schema.str_schema(pattern=r"^(?:[a-z0-9._-]+:)?[a-z0-9./_-]+$"),
      serialization=core_schema.plain_serializer_function_ser_schema(
        str,
        return_schema=core_schema.str_schema(),
      ),
    )


type CompactList[T] = Annotated[
  list[T], BeforeValidator(lambda v: v if v is None or isinstance(v, list) else [v])
]


class SNBT(BaseModel):
  snbt: Annotated[
    str,
    AfterValidator(
      lambda v: v if len(v) > 0 and v[0] in ("{", "[", '"', "'") else repr(v)
    ),
  ]


class EnchantmentComponent(StrEnum):
  ENCHANTMENTS = auto()
  STORED_ENCHANTMENTS = auto()

  def full_id(self):
    return f"minecraft:{self.value}"


class CatBookOutput(BaseModel):
  function: Identifier
  enchantment_tag: Identifier
  hash_names: bool = False


class CatBookEnchantment(BaseModel):
  page_name: str
  supports: SNBT | None = None
  level_dependent: bool = True
  linked_keywords: CompactList[SNBT] = []
  handler_override: dict[EnchantmentComponent, Identifier] = {}

  def default_handler_commands(
    self, component: EnchantmentComponent, ench_id: Identifier
  ):
    lines: list[str] = []

    linked = self.linked_keywords.copy()
    if component == "stored_enchantments" and self.supports is not None:
      linked.append(self.supports)

    page_name = repr(self.page_name)
    # simplest page link
    if len(linked) == 0 and not self.level_dependent:
      lines.append(f"data modify storage catalog:index value append value {page_name}")
    # page with extra data
    else:
      linked_repr = (
        ""
        if len(linked) == 0
        else "linked: [{}]".format(",".join(v.snbt for v in linked))
      )
      lines.append(
        f"data modify storage catalog:index value append value {{id: {page_name}, {linked_repr}}}"
      )
      if self.level_dependent:
        lines.append(
          f"data modify storage catalog:index value[-1].context set from storage catalog:inspecting_item value.components.{component.full_id()}.{ench_id!r}"
        )
    return lines


class CatBookDatagen(BaseModel):
  output: CatBookOutput
  enchantments: dict[Identifier, CatBookEnchantment] = {}

  def resolve_ench_id(
    self,
    ench_id: Identifier,
    root: Identifier,
    component: EnchantmentComponent | None = None,
  ):
    if not self.output.hash_names:
      return ench_id.resolve_against(root)
    else:
      to_hash = ench_id if component is None else ench_id.resolve_against(component)
      return root / md5(str(to_hash).encode()).hexdigest()[:7]

  def __call__(self, ctx: Context):
    dispatcher_functions: dict[EnchantmentComponent, list[str]] = {}
    # handler of enchantments
    for ench_id, entry in self.enchantments.items():
      # create holder tag
      holder_tag = self.resolve_ench_id(ench_id, self.output.enchantment_tag)
      ctx.data.enchantment_tags[str(holder_tag)] = EnchantmentTag(
        {"values": [{"id": str(ench_id), "required": False}]}
      )
      # handle components
      for component in EnchantmentComponent:
        lines = (
          [f"function {entry.handler_override[component]}"]
          if component in entry.handler_override
          else entry.default_handler_commands(component, ench_id)
        )
        # define full function
        if len(lines) == 0:
          continue
        elif len(lines) > 1:
          handler_func_id = self.resolve_ench_id(
            ench_id, self.output.function, component
          )
          ctx.data.functions[str(handler_func_id)] = Function(lines)
          handler_command = f"function {handler_func_id}"
        else:
          handler_command = lines[0]
        # add dispatch command
        dispatcher_functions.setdefault(component, []).append(
          "execute if items entity @s contents *[{}~[{{enchantments: {}}}]] run {}".format(
            component,
            repr("#" + str(holder_tag)),
            handler_command,
          )
        )
    # define dispatcher functions
    for component, lines in dispatcher_functions.items():
      dispatcher_func_id = self.output.function / component
      ctx.data.functions[str(dispatcher_func_id)] = Function(lines)
      ctx.data.function_tags.setdefault(f"catalog:describe/{component}").append(
        FunctionTag({"values": [str(dispatcher_func_id)]})
      )

  def __hash__(self) -> int:
    return hash(self.__call__)


@configurable("catalog_datagen", validator=CatBookDatagen)
def beet_default(ctx: Context, datagen: CatBookDatagen):
  ctx.require(datagen)
