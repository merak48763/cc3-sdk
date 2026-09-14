data modify storage cc3:config death_stats_location \
  set compute default integer cc3.impl:config/death_stats_location/op/next

function cc3.impl:config/refresh_screen

scoreboard objectives setdisplay sidebar
scoreboard objectives setdisplay list
execute if predicate cc3.impl:var_check/death_stats_location/sidebar \
  run return run scoreboard objectives setdisplay sidebar cc3.stats.deaths
execute if predicate cc3.impl:var_check/death_stats_location/tab_list \
  run return run scoreboard objectives setdisplay list cc3.stats.deaths
