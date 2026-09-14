# as & at player opening a dialog

function algol.core:load_player_storage
execute if data storage algol:player_storage value{"al/active_dialog": "cc3:teleporter"} \
  unless entity @e[tag=cc3.teleporter, type=interaction, distance=..8] \
  run function algol.dialog:close
