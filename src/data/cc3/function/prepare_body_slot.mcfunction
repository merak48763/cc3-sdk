execute unless entity @s[type=player] run return fail

execute unless items entity @s armor.body * \
  run item replace entity @s armor.body with command_block[ \
    equippable={slot: "body", equip_sound: "intentionally_empty"}, \
    enchantments={vanishing_curse: 1, binding_curse: 1}, \
    custom_data={smithed: {ignore: {everything: 1b}}} \
  ]
