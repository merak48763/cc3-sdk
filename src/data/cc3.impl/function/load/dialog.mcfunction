data modify storage algol:dialog_registry value."cc3:config" set value { \
  show: "function cc3.impl:config/show_screen", \
  buttons: { \
    1: "function cc3.impl:config/change_difficulty", \
    2: "function cc3.impl:config/change_death_tax", \
    3: "function cc3.impl:config/change_pvp", \
    4: "function cc3.impl:config/change_death_stats", \
    11: "function cc3.impl:config/reset_difficulty", \
    12: "function cc3.impl:config/reset_death_tax", \
    13: "function cc3.impl:config/reset_pvp", \
    14: "function cc3.impl:config/reset_death_stats", \
  } \
}
data modify storage algol:dialog_registry value."cc3:teleporter" set value { \
  show: "function cc3.impl:teleporter/show_screen", \
  form_idle_value: -1, \
  on_form_submit: "function cc3.impl:teleporter/handle_input" \
}
