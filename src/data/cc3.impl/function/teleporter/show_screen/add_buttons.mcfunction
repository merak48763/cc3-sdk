data modify storage cc3:teleporter iter.this set from storage cc3:teleporter iter.remaining[0]
data remove storage cc3:teleporter iter.remaining[0]

execute if data storage cc3:teleporter iter.this.unlocked \
  run function cc3.impl:teleporter/show_screen/add_buttons/create_button

data modify storage cc3:var counter set compute default integer cc3.impl:var/counter/op/next
execute if data storage cc3:teleporter iter.remaining[0] run function cc3.impl:teleporter/show_screen/add_buttons
