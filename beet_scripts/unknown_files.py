from beet import Context, TagFile, JsonFile, NamespaceFileScope
from beet.contrib.unknown_files import unknown_files, UnknownAsset, UnknownData
from typing import ClassVar
import logging

LOGGER = logging.getLogger(__name__)


class ContextFloatProvider(JsonFile):
  extension: ClassVar[str] = ".json"
  scope: ClassVar[NamespaceFileScope] = ("context_float_provider",)

class ContextIntProvider(JsonFile):
  extension: ClassVar[str] = ".json"
  scope: ClassVar[NamespaceFileScope] = ("context_int_provider",)

class SlotSource(JsonFile):
  extension: ClassVar[str] = ".json"
  scope: ClassVar[NamespaceFileScope] = ("slot_source",)

class PredicateTag(TagFile):
  scope: ClassVar[NamespaceFileScope] = ("tags", "predicate")


# mcbeet/beet#518 should fix this
def patch_file_types(ctx: Context):
  ctx.data.extend_namespace.append(ContextFloatProvider)
  ctx.data.extend_namespace.append(ContextIntProvider)
  ctx.data.extend_namespace.append(SlotSource)
  ctx.data.extend_namespace.append(PredicateTag)

# should be invoked at "require" stage
def beet_default(ctx: Context):
  ctx.require(patch_file_types)
  ctx.require(unknown_files)
  yield

  if len(keys := ctx.data[UnknownData].keys()) > 0:
    LOGGER.warning(f"Loaded unknown data files:\n  {'\n  '.join(keys)}")
  if len(keys := ctx.assets[UnknownAsset].keys()) > 0:
    LOGGER.warning(f"Loaded unknown asset files:\n  {'\n  '.join(keys)}")
