data remove storage cc3:teleporter iter
execute store result storage cc3:macro list_access.index int 1 \
  run scoreboard players get @s al.dialog.form_submission
function cc3.impl:teleporter/handle_input/load_teleporter with storage cc3:macro list_access

execute if data storage cc3:teleporter iter.this.unlocked \
  run function cc3.impl:teleporter/handle_input/teleport with storage cc3:teleporter iter.this.pos

function algol.dialog:close
