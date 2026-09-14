data modify storage cc3:teleporter iter.this set from storage cc3:teleporter iter.remaining[0]
data remove storage cc3:teleporter iter.remaining[0]

function cc3.impl:teleporter/init/create_entities with storage cc3:teleporter iter.this.pos

data modify storage cc3:var counter set compute default integer cc3.impl:var/counter/op/next
execute if data storage cc3:teleporter iter.remaining[0] run function cc3.impl:teleporter/init/teleporter_iter
