tag @s add cc3.teleporter
execute store result score @s cc3.teleporter_id \
  run compute default integer cc3.impl:var/counter
