execute unless entity @s[gamemode=creative] run return fail

function cc3.impl:teleporter/init
tellraw @s "Initialized teleporters."
