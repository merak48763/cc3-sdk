tag @s remove cc3.death_tax_exempt

execute if predicate cc3.impl:death_tax/active \
  run tellraw @s {translate: "text.cc3.death_tax_exempt.boss"}
