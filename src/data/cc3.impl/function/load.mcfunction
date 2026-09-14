function cc3.impl:load/set_game_rules
function cc3.impl:load/dialog

# unset: discarded entity
# set: related to a teleporter
scoreboard objectives add cc3.teleporter_id dummy

scoreboard objectives add cc3.stats.deaths custom:deaths {translate: "text.cc3.stats.deaths"}
scoreboard objectives add cc3.stats.mob_kills custom:mob_kills {translate: "text.cc3.stats.mob_kills"}
scoreboard objectives add cc3.stats.spawner broken:spawner {translate: "text.cc3.stats.spawner"}
scoreboard objectives add cc3.stats.time custom:play_time {translate: "text.cc3.stats.time"}
scoreboard objectives add cc3.stats.torch dummy {translate: "text.cc3.stats.torch"}
scoreboard objectives add cc3.stats.totems dummy {translate: "text.cc3.stats.totems"}

team add cc3.player {translate: "entity.minecraft.player"}

# start schedule loop
schedule function cc3.impl:tick_deferred 1t append
schedule function cc3.impl:teleporter/gc 1s replace
