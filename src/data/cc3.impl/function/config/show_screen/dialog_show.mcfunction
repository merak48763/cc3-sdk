$dialog show @s { \
  type: "multi_action", \
  title: {translate: "options.title"}, \
  after_action: "none", pause: false, columns: 2, \
  actions: [ \
    { \
      label: {translate: "options.generic_value", with: [{translate: "options.difficulty"}, {translate: "options.difficulty.$(difficulty)"}]}, \
      tooltip: {translate: "text.cc3.config.difficulty.$(difficulty).info"}, \
      width: 150, \
      action: {type: "run_command", command: "trigger al.dialog.button set 1"} \
    }, \
    { \
      label: {translate: "text.cc3.config.reset"}, \
      width: 50, \
      action: {type: "run_command", command: "trigger al.dialog.button set 11"} \
    }, \
    { \
      label: {translate: "options.generic_value", with: [{translate: "text.cc3.config.death_tax"}, {translate: "text.cc3.config.death_tax.$(death_tax)"}]}, \
      tooltip: {translate: "text.cc3.config.death_tax.$(death_tax).info"}, \
      width: 150, \
      action: {type: "run_command", command: "trigger al.dialog.button set 2"} \
    }, \
    { \
      label: {translate: "text.cc3.config.reset"}, \
      width: 50, \
      action: {type: "run_command", command: "trigger al.dialog.button set 12"} \
    }, \
    { \
      label: {translate: "options.generic_value", with: [{translate: "gamerule.minecraft.pvp"}, {translate: "options.$(pvp)"}]}, \
      width: 150, \
      action: {type: "run_command", command: "trigger al.dialog.button set 3"} \
    }, \
    { \
      label: {translate: "text.cc3.config.reset"}, \
      width: 50, \
      action: {type: "run_command", command: "trigger al.dialog.button set 13"} \
    } \
  ], \
  exit_action: { \
    label: {translate: "gui.done"}, \
    width: 200, \
    action: {type: "run_command", command: "trigger al.dialog.button set -1"} \
  } \
}
