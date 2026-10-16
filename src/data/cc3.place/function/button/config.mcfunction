execute unless entity @s[gamemode=creative] run return fail
execute align xyz positioned ~.5 ~1.3 ~.5 \
  if entity @e[tag=cc3.button, type=interaction, distance=...01, limit=1] \
  run return fail

execute align xyz run summon interaction ~.5 ~1.3 ~.5 { \
  Tags: ["cc3.button"], \
  height: .5, width: .5, response: true, \
  data: { \
    "al/on_attack": {run: 'execute on attacker run function algol.dialog:open {id: "cc3:config"}'}, \
    "al/on_interact": {run: 'execute on target run function algol.dialog:open {id: "cc3:config"}'} \
  } \
}
execute align xyz run summon text_display ~.5 ~1.1 ~.5 { \
  Tags: ["cc3.button", "al.refresh"], \
  text: {translate: "text.cc3.thing", fallback: ":(", with: [{translate: "options.title"}]}, \
  transformation: {right_rotation: [0f, 0f, 0f, 1f], scale: [.9f, .9f, .9f], left_rotation: [0f, 0f, 0f, 1f], translation: [0f, 0f, 0f]}, \
  billboard: "center", view_range: .3 \
}
execute align xyz if block ~ ~1 ~ #air run setblock ~ ~1 ~ light[level=7] strict
