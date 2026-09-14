# init stats
scoreboard players add @s cc3.stats.deaths 0
scoreboard players add @s cc3.stats.mob_kills 0
scoreboard players add @s cc3.stats.spawner 0
scoreboard players add @s cc3.stats.time 0
scoreboard players add @s cc3.stats.torch 0
scoreboard players add @s cc3.stats.totems 0

# init storage
function algol.core:load_player_storage
execute unless data storage algol:player_storage value."cc3/action_bar" \
  run data modify storage algol:player_storage value."cc3/action_bar" set value []
