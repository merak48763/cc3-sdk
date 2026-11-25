# manually run in map once

# placeholder value
data modify storage cc3:teleporter teleporters set value [ \
  { \
    name: {text: "Very far away", color: "yellow"}, \
    pos: {x: 10000, y: 106, z: 0} \
  }, \
  { \
    name: {text: "Test 001"}, \
    pos: {x: 73, y: 106, z: -23} \
  }, \
  { \
    name: {text: "Test 002"}, \
    pos: {x: 0, y: 200, z: 0} \
  } \
]

# invalidate all old entities
scoreboard players reset * cc3.teleporter_id

data modify storage cc3:var counter set value 0
data modify storage cc3:teleporter iter.remaining set from storage cc3:teleporter teleporters
execute if data storage cc3:teleporter iter.remaining[0] run function cc3.impl:teleporter/init/teleporter_iter
