function cc3.impl:load/set_game_rules
function cc3.impl:load/dialog

# unset: discarded entity
# set: related to a teleporter
scoreboard objectives add cc3.teleporter_id dummy

team add cc3.player {translate: "entity.minecraft.player"}

# start low frequency loop
schedule function cc3.impl:teleporter/gc 1s replace
