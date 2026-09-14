from beet import Context, Font
from pydantic import BaseModel, Field
from typing import Annotated, Any, Literal, Optional
import json

TARGET_TRANSLATIONS = set([
  "text.cc3.stats.deaths",
  "text.cc3.stats.mob_kills",
  "text.cc3.stats.spawner",
  "text.cc3.stats.time",
  "text.cc3.stats.torch",
  "text.cc3.stats.totems",
  "text.cc3.time_unit.0",
  "text.cc3.time_unit.1",
  "text.cc3.time_unit.2",
  "text.cc3.time_unit.3",
  "text.cc3.time_unit.4",
])


class FilterFlags(BaseModel):
  uniform: Optional[bool] = None
  jp: Optional[bool] = None

class FontProviderBase(BaseModel):
  filter: Optional[FilterFlags] = None

class FontWidthData(FontProviderBase):
  type: Literal["widths"] = "widths"
  widths: dict[int, float] = {}

class FontReferenceData(FontProviderBase):
  type: Literal["reference"] = "reference"
  reference: str

type FontData = Annotated[FontWidthData | FontReferenceData, Field(discriminator="type")]

class ImportedFontInfo(BaseModel):
  data: dict[str, list[FontData]]


def pack_number(v: float) -> int | float:
  return int(v) if v.is_integer() else v

def beet_default(ctx: Context):
  charset = set("0123456789.- ")
  for lang in ctx.assets.languages.values():
    for (key, value) in lang.data.items():
      if key in TARGET_TRANSLATIONS and isinstance(value, str):
        charset.update(value)

  target_chars = sorted(map(lambda s: ord(s), charset))

  with open("beet_scripts/font_widths.json") as f:
    font_info = ImportedFontInfo(**json.load(f))

  space_providers: list[dict[str, Any]] = []
  for info_source in ("minecraft:include/space", "minecraft:include/default", "minecraft:include/unifont"):
    for font_data in font_info.data.get(info_source, []):
      if font_data.type == "widths":
        advances: dict[str, int | float] = {
          chr(cp): pack_number(-font_data.widths[cp])
          for cp in target_chars
          if cp in font_data.widths
        }
        if len(advances) > 0:
          filter_flags = font_data.filter.model_dump() if font_data.filter is not None else {}
          if info_source == "minecraft:include/default":
            filter_flags["uniform"] = False
          filter_flags = {k: v for (k, v) in filter_flags.items() if v is not None}
          space_providers.append({
            "type": "space",
            "advances": advances
          })
          if len(filter_flags) > 0:
            space_providers[-1]["filter"] = filter_flags

  ctx.assets.fonts.setdefault("cc3.impl:inv", Font({"providers": []})).data["providers"] = space_providers
