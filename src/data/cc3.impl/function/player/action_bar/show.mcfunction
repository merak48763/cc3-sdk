data modify storage algol:player_storage value."cc3/action_bar" prepend value {id: "", text: ""}
data modify storage algol:player_storage value."cc3/action_bar" append value {id: "", text: ""}

title @s actionbar {storage: "algol:player_storage", nbt: 'value."cc3/action_bar"[].text', separator: " ", interpret: true}

data remove storage algol:player_storage value."cc3/action_bar"[0]
data remove storage algol:player_storage value."cc3/action_bar"[-1]

tag @s add cc3.action_bar_active
