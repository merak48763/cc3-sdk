execute store result storage cc3:macro stats_screen.deaths int 1 \
  run scoreboard players get @s cc3.stats.deaths
execute store result storage cc3:macro stats_screen.mob_kills int 1 \
  run scoreboard players get @s cc3.stats.mob_kills
execute store result storage cc3:macro stats_screen.spawner int 1 \
  run scoreboard players get @s cc3.stats.spawner
execute store result storage cc3:macro stats_screen.torch int 1 \
  run scoreboard players get @s cc3.stats.torch
execute store result storage cc3:macro stats_screen.totems int 1 \
  run scoreboard players get @s cc3.stats.totems

data modify storage cc3:macro stats_screen.time_h \
  set compute default integer cc3.impl:play_time/hours
data modify storage cc3:macro stats_screen.time_m \
  set compute default integer cc3.impl:play_time/minutes

function cc3.impl:stats/show_screen/dialog_show with storage cc3:macro stats_screen
