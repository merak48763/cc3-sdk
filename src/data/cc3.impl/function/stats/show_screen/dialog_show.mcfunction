$dialog show @s { \
  type: "confirmation", \
  title: {translate: "gui.stats"}, \
  after_action: "none", pause: false, \
  body: [{ \
    type: "plain_message", \
    contents: [ \
      { \
        translate: "fmt.cc3.stats_entry", \
        with: [ \
          {translate: "text.cc3.stats.deaths"}, \
          {translate: "text.cc3.stats.deaths", font: "cc3.impl:inv"}, \
          $(deaths), \
          {text: "$(deaths)", font: "cc3.impl:inv"}, \
          {text: "\ue001", font: "cc3.impl:space"}, \
          {text: "\ue002", font: "cc3.impl:space"}, \
          {text: "\ue003", font: "cc3.impl:space"}, \
          {text: "\ue004", font: "cc3.impl:space"}, \
          {text: "\ue005", font: "cc3.impl:space"} \
        ] \
      }, "\n", \
      { \
        translate: "fmt.cc3.stats_entry", \
        with: [ \
          {translate: "text.cc3.stats.mob_kills"}, \
          {translate: "text.cc3.stats.mob_kills", font: "cc3.impl:inv"}, \
          $(mob_kills), \
          {text: "$(mob_kills)", font: "cc3.impl:inv"}, \
          {text: "\ue001", font: "cc3.impl:space"}, \
          {text: "\ue002", font: "cc3.impl:space"}, \
          {text: "\ue003", font: "cc3.impl:space"}, \
          {text: "\ue004", font: "cc3.impl:space"}, \
          {text: "\ue005", font: "cc3.impl:space"} \
        ] \
      }, "\n", \
      { \
        translate: "fmt.cc3.stats_entry", \
        with: [ \
          {translate: "text.cc3.stats.spawner"}, \
          {translate: "text.cc3.stats.spawner", font: "cc3.impl:inv"}, \
          $(spawner), \
          {text: "$(spawner)", font: "cc3.impl:inv"}, \
          {text: "\ue001", font: "cc3.impl:space"}, \
          {text: "\ue002", font: "cc3.impl:space"}, \
          {text: "\ue003", font: "cc3.impl:space"}, \
          {text: "\ue004", font: "cc3.impl:space"}, \
          {text: "\ue005", font: "cc3.impl:space"} \
        ] \
      }, "\n", \
      { \
        translate: "fmt.cc3.stats_entry", \
        with: [ \
          {translate: "text.cc3.stats.torch"}, \
          {translate: "text.cc3.stats.torch", font: "cc3.impl:inv"}, \
          $(torch), \
          {text: "$(torch)", font: "cc3.impl:inv"}, \
          {text: "\ue001", font: "cc3.impl:space"}, \
          {text: "\ue002", font: "cc3.impl:space"}, \
          {text: "\ue003", font: "cc3.impl:space"}, \
          {text: "\ue004", font: "cc3.impl:space"}, \
          {text: "\ue005", font: "cc3.impl:space"} \
        ] \
      }, "\n", \
      { \
        translate: "fmt.cc3.stats_entry", \
        with: [ \
          {translate: "text.cc3.stats.totems"}, \
          {translate: "text.cc3.stats.totems", font: "cc3.impl:inv"}, \
          $(totems), \
          {text: "$(totems)", font: "cc3.impl:inv"}, \
          {text: "\ue001", font: "cc3.impl:space"}, \
          {text: "\ue002", font: "cc3.impl:space"}, \
          {text: "\ue003", font: "cc3.impl:space"}, \
          {text: "\ue004", font: "cc3.impl:space"}, \
          {text: "\ue005", font: "cc3.impl:space"} \
        ] \
      }, "\n", \
      { \
        translate: "fmt.cc3.stats_entry", \
        with: [ \
          {translate: "text.cc3.stats.time"}, \
          {translate: "text.cc3.stats.time", font: "cc3.impl:inv"}, \
          {translate: "fmt.cc3.time_with_unit", with: [$(time), {translate: "text.cc3.time_unit.$(time_unit_type)"}]}, \
          {translate: "fmt.cc3.time_with_unit", with: [$(time), {translate: "text.cc3.time_unit.$(time_unit_type)"}], font: "cc3.impl:inv"}, \
          {text: "\ue001", font: "cc3.impl:space"}, \
          {text: "\ue002", font: "cc3.impl:space"}, \
          {text: "\ue003", font: "cc3.impl:space"}, \
          {text: "\ue004", font: "cc3.impl:space"}, \
          {text: "\ue005", font: "cc3.impl:space"} \
        ] \
      } \
    ], \
    width: 300 \
  }], \
  yes: { \
    label: {translate: "text.cc3.share_stats"}, \
    action: {type: "run_command", command: "trigger al.dialog.button set 1"} \
  }, \
  no: { \
    label: {translate: "gui.done"}, \
    action: {type: "run_command", command: "trigger al.dialog.button set -1"} \
  } \
}
