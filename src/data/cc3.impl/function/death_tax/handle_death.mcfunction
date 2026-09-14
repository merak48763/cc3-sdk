execute if entity @s[tag=cc3.death_tax_exempt] \
  run return run function cc3.impl:death_tax/exempt/boss

item modify entity @s[gamemode=!spectator, gamemode=!creative] cc3:survival_inventory cc3.impl:death_tax
