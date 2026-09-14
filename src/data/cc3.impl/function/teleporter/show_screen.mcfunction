data modify storage cc3:macro teleporter_screen.buttons set value []
data modify storage cc3:var counter set value 0
data modify storage cc3:teleporter iter.remaining set from storage cc3:teleporter teleporters
execute if data storage cc3:teleporter iter.remaining[0] run function cc3.impl:teleporter/show_screen/add_buttons

execute if data storage cc3:macro teleporter_screen.buttons[0] \
  run return run function cc3.impl:teleporter/show_screen/dialog_show with storage cc3:macro teleporter_screen
dialog show @s cc3.impl:empty_teleporter
