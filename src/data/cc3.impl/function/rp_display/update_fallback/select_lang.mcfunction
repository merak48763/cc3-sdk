# CustomName is translated "language.code"

# zh_tw
execute if entity @s[name=zho-Hant_TW] \
  run return run data modify entity @s text.with[1] set value "資源包"
# fallback: en_us
data modify entity @s text.with[1] set value "Resource Pack"
