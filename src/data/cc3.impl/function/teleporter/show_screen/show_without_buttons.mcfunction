# text.cc3.teleporter.title -> Teleporter
# text.cc3.teleporter.info -> (tutorial)
# text.cc3.teleporter.empty -> (message)

$dialog show @s { \
  type: "notice", \
  title: {translate: "text.cc3.teleporter.title"}, \
  after_action: "none", pause: false, \
  body: { \
    type: "plain_message", \
    contents: {translate: "text.cc3.teleporter.empty", with: [$(name)]}, \
    width: 250 \
  }, \
  action: { \
    label: {translate: "gui.cancel"}, \
    action: {type: "run_command", command: "trigger al.dialog.button set -1"}, \
    width: 180 \
  } \
}
