# button: interaction

function cc3.impl:teleporter/init/create_entities/init_common
data merge entity @s { \
  data: { \
    "al/on_interact": {run: 'function cc3.impl:teleporter/handle_interact'} \
  }, \
  height: 1, width: 1 \
}
