# as player

# difficulty
execute store result storage cc3:var difficulty int 1 run difficulty
data modify storage cc3:macro config_screen.difficulty set value "easy"
execute if predicate cc3.impl:var_check/difficulty/normal \
  run data modify storage cc3:macro config_screen.difficulty set value "normal"
execute if predicate cc3.impl:var_check/difficulty/hard \
  run data modify storage cc3:macro config_screen.difficulty set value "hard"

# death tax
data modify storage cc3:macro config_screen.death_tax set value "off"
execute if predicate cc3.impl:var_check/death_tax_mode/mild \
  run data modify storage cc3:macro config_screen.death_tax set value "mild"
execute if predicate cc3.impl:var_check/death_tax_mode/normal \
  run data modify storage cc3:macro config_screen.death_tax set value "normal"
execute if predicate cc3.impl:var_check/death_tax_mode/challenge \
  run data modify storage cc3:macro config_screen.death_tax set value "challenge"

# pvp
execute store result storage cc3:var pvp int 1 run gamerule pvp
data modify storage cc3:macro config_screen.pvp set value "off"
execute if predicate cc3.impl:var_check/pvp/on \
  run data modify storage cc3:macro config_screen.pvp set value "on"

function cc3.impl:config/show_screen/dialog_show with storage cc3:macro config_screen
