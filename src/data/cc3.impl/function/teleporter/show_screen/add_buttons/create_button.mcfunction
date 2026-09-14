# base button
data modify storage cc3:macro teleporter_screen.buttons \
  append value {label: "", action: {type: "run_command", command: "trigger al.dialog.button set -1"}}

# label
data modify storage cc3:macro teleporter_screen.buttons[-1].label \
  set from storage cc3:teleporter iter.this.name

# trigger command
data modify storage cc3:macro list_access.index set compute default integer cc3.impl:var/counter
function cc3.impl:teleporter/show_screen/add_buttons/set_trigger_command with storage cc3:macro list_access
