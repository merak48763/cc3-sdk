execute summon marker run function cc3.impl:teleporter/init/create_entities/init_common
execute summon interaction run function cc3.impl:teleporter/init/create_entities/init_button
execute positioned ~ ~.5 ~ \
  summon item_display run function cc3.impl:teleporter/init/create_entities/init_model
execute positioned ~ ~1 ~ \
  summon text_display run function cc3.impl:teleporter/init/create_entities/init_text
