from beet import Context, Language

TARGET_NAMESPACE = "cc3"

ROMAN_HUNDREDS = ["", "C", "CC"]
ROMAN_TENS = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
ROMAN_UNITS = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]


def roman(number: int) -> str:
  hundreds = ROMAN_HUNDREDS[number // 100]
  tens = ROMAN_TENS[number // 10 % 10]
  units = ROMAN_UNITS[number % 10]
  return hundreds + tens + units


def beet_default(ctx: Context):
  ctx.assets.languages.setdefault(f"{TARGET_NAMESPACE}:en_us").merge(
    Language({f"enchantment.level.{i}": roman(i) for i in range(11, 256)})
  )
