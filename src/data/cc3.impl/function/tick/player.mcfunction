function cc3.impl:player/adventure_mode

execute if score @s lexica matches 1 \
  run function algol.core:loot_give {loot: "catalog:book"}
scoreboard players set @s lexica 0
scoreboard players enable @s lexica

execute if entity @s[tag=al.dialog.open] run function cc3.impl:teleporter/hold_dialog

execute if predicate cc3.impl:should_join_player_team \
  run return run team join cc3.player @s
team leave @s
