# scheduled low frequency function
# remove invalidated entities

# marker is handled by tick function
execute at @e[predicate=cc3.impl:teleporter/invalidated, tag=cc3.teleporter, type=interaction] \
  if block ~ ~ ~ light run setblock ~ ~ ~ air
kill @e[predicate=cc3.impl:teleporter/invalidated, tag=cc3.teleporter, type=interaction]
kill @e[predicate=cc3.impl:teleporter/invalidated, tag=cc3.teleporter, type=item_display]
kill @e[predicate=cc3.impl:teleporter/invalidated, tag=cc3.teleporter, type=text_display]

schedule function cc3.impl:teleporter/gc 1s replace
