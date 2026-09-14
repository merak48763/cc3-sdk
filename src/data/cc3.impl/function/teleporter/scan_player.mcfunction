# as scanner marker

execute if predicate cc3.impl:teleporter/invalidated \
  run return run kill @s

execute unless entity @a[team=cc3.player, distance=..8, limit=1] run return 1

execute store result storage cc3:macro list_access.index int 1 \
  run scoreboard players get @s cc3.teleporter_id
function cc3.impl:teleporter/scan_player/unlock_teleporter with storage cc3:macro list_access
kill @s
