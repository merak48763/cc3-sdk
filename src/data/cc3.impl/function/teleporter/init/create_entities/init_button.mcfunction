# button: interaction

function cc3.impl:teleporter/init/create_entities/init_common
data merge entity @s { \
  data: { \
    "al/on_interact": {run: 'execute on target run function algol.dialog:open {id: "cc3:teleporter"}'} \
  }, \
  height: 1, width: 1 \
}
