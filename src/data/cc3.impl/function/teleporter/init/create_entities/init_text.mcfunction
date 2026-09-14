# text: text display

function cc3.impl:teleporter/init/create_entities/init_common
data merge entity @s { \
  billboard: "vertical" \
}
data modify entity @s text set from storage cc3:teleporter iter.this.name
tag @s add al.refresh
