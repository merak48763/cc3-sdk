function cc3.impl:tick/player/adventure_mode

execute if entity @s[tag=al.dialog.open] run function cc3.impl:teleporter/hold_dialog

execute if predicate cc3.impl:should_join_player_team \
  run return run team join cc3.player @s
team leave @s
