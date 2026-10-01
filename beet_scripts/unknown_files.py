from beet import Context
from beet.contrib.unknown_files import unknown_files, UnknownAsset, UnknownData
import logging

LOGGER = logging.getLogger(__name__)


# should be invoked at "require" stage
def beet_default(ctx: Context):
  ctx.require(unknown_files)
  yield

  if len(keys := ctx.data[UnknownData].keys()) > 0:
    LOGGER.warning(f"Loaded unknown data files:\n  {'\n  '.join(keys)}")
  if len(keys := ctx.assets[UnknownAsset].keys()) > 0:
    LOGGER.warning(f"Loaded unknown asset files:\n  {'\n  '.join(keys)}")
