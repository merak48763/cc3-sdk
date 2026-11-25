# text.cc3.teleporter.title -> Teleporter
# text.cc3.teleporter.info -> (tutorial)
# text.cc3.teleporter.empty -> (message)

$dialog show @s { \
  type: "multi_action", \
  title: {translate: "text.cc3.teleporter.title"}, \
  after_action: "none", pause: false, columns: 1, \
  body: { \
    type: "plain_message", \
    contents: {translate: "text.cc3.teleporter.info", with: [$(name)]}, \
    width: 250 \
  }, \
  actions: $(buttons), \
  exit_action: { \
    label: {translate: "gui.cancel"}, \
    action: {type: "run_command", command: "trigger al.dialog.button set -1"}, \
    width: 180 \
  } \
}
