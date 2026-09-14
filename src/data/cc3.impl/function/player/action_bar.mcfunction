function algol.core:load_player_storage

execute store result storage cc3:var counter int 1 \
  run data get storage algol:player_storage value."cc3/action_bar"

# has text
execute if predicate cc3.impl:var_check/counter/gt_0 \
  run return run function cc3.impl:player/action_bar/show
# no text
  # clear once
  title @s[tag=cc3.action_bar_active] actionbar ""
  # remove tag
  tag @s remove cc3.action_bar_active
