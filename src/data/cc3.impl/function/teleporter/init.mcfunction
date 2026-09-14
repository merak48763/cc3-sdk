# manually run in map once

execute unless entity @s[gamemode=creative] run return fail

data modify storage cc3:teleporter teleporters set value [ \
  { \
    name: "Very far away", \
    pos: {x: 10000, y: 106, z: 0} \
  }, \
  { \
    name: "Test 001", \
    pos: {x: 73, y: 106, z: -23} \
  }, \
  { \
    name: "Test 002", \
    pos: {x: 0, y: 200, z: 0} \
  } \
]

# invalidate all old entities
scoreboard players reset * cc3.teleporter_id

data modify storage cc3:var counter set value 0
data modify storage cc3:teleporter iter.remaining set from storage cc3:teleporter teleporters
execute if data storage cc3:teleporter iter.remaining[0] run function cc3.impl:teleporter/init/teleporter_iter

tellraw @s "Initialized teleporters."
