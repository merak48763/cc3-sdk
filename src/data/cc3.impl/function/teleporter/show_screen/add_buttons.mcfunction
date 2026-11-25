data modify storage cc3:teleporter iter.this set from storage cc3:teleporter iter.remaining[0]
data remove storage cc3:teleporter iter.remaining[0]

# unlocked & not current teleporter -> add button
execute if data storage cc3:teleporter iter.this.unlocked \
  unless predicate cc3.impl:teleporter/match_interacted \
  run function cc3.impl:teleporter/show_screen/add_buttons/create_button
# is current teleporter -> get name
execute if predicate cc3.impl:teleporter/match_interacted \
  run data modify storage cc3:macro teleporter_screen.name \
  set from storage cc3:teleporter iter.this.name

data modify storage cc3:var counter set compute default integer cc3.impl:var/counter/op/next
execute if data storage cc3:teleporter iter.remaining[0] run function cc3.impl:teleporter/show_screen/add_buttons
