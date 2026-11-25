$data modify storage cc3:teleporter teleporters[$(index)].unlocked set value {}
particle end_rod ~ ~.5 ~ .3 .6 .3 .05 30
playsound cc3:teleporter.unlock block @a ~ ~.5 ~
execute if block ~ ~ ~ air run setblock ~ ~ ~ light[level=7]
