execute unless entity @s[gamemode=creative] run return fail
execute align xyz positioned ~.5 ~ ~.5 \
  if entity @e[tag=cc3.stat_button, type=interaction, distance=...01, limit=1] \
  run return fail

execute align xyz run summon interaction ~.5 ~ ~.5 { \
  Tags: ["cc3.stat_button"], \
  height: 1.125, width: 1, response: true, \
  data: { \
    "al/on_attack": {run: 'execute on attacker run function algol.dialog:open {id: "cc3:stats"}'}, \
    "al/on_interact": {run: 'execute on target run function algol.dialog:open {id: "cc3:stats"}'} \
  } \
}
execute align xyz run summon item_display ~.5 ~.5 ~.5 { \
  Tags: ["cc3.stat_button"], \
  item: {id: "lectern"} \
}
execute align xyz run summon text_display ~.5 ~1.2 ~.5 { \
  Tags: ["cc3.stat_button", "al.refresh"], \
  text: {translate: "gui.stats"}, \
  transformation: {right_rotation: [0f, 0f, 0f, 1f], scale: [.9f, .9f, .9f], left_rotation: [0f, 0f, 0f, 1f], translation: [0f, 0f, 0f]}, \
  billboard: "center", view_range: .4 \
}

execute align xyz positioned ~.5 ~.5 ~.5 \
  as @e[tag=cc3.stat_button, type=item_display, distance=...01, limit=1] \
  positioned 0. 0 0. \
  rotated ~45 0 \
  positioned ^ ^ ^-.5 \
  align xz \
  facing -.5 0 -.5 \
  run rotate @s ~135 0
