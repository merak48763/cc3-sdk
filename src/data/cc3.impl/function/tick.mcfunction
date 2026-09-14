execute as @a at @s run function cc3.impl:tick/player

execute as @e[tag=cc3.teleporter, type=marker] at @s \
  run function cc3.impl:teleporter/scan_player

item replace entity @e[type=villager] armor.body with command_block[ \
  equippable={slot: "body", equip_sound: "intentionally_empty"}, \
  enchantments={vanishing_curse: 1, binding_curse: 1, "cc3.impl:villager_explode": 1} \
]
