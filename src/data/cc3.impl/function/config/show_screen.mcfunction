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
data modify storage cc3:macro config_screen.death_tax_trailing_styles set value ""
execute if predicate cc3.impl:var_check/death_tax_mode/mild \
  run data modify storage cc3:macro config_screen.death_tax set value "mild"
execute if predicate cc3.impl:var_check/death_tax_mode/normal \
  run data modify storage cc3:macro config_screen.death_tax set value "normal"
execute if predicate cc3.impl:var_check/death_tax_mode/challenge \
  run data modify storage cc3:macro config_screen.death_tax set value "challenge"
execute if predicate cc3.impl:var_check/death_tax_mode/challenge \
  run data modify storage cc3:macro config_screen.death_tax_trailing_styles set value ', color: "#ff8888"'

# pvp
execute store result storage cc3:var pvp int 1 run gamerule pvp
data modify storage cc3:macro config_screen.pvp set value "off"
execute if predicate cc3.impl:var_check/pvp/on \
  run data modify storage cc3:macro config_screen.pvp set value "on"

# death stats location
data modify storage cc3:macro config_screen.death_stats set value "off"
execute if predicate cc3.impl:var_check/death_stats_location/sidebar \
  run data modify storage cc3:macro config_screen.death_stats set value "sidebar"
execute if predicate cc3.impl:var_check/death_stats_location/tab_list \
  run data modify storage cc3:macro config_screen.death_stats set value "list"

function cc3.impl:config/show_screen/dialog_show with storage cc3:macro config_screen
