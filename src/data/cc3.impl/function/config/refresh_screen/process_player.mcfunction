function algol.core:load_player_storage
execute if data storage algol:player_storage value{"al/active_dialog": "cc3:config"} \
  run function cc3.impl:config/show_screen
