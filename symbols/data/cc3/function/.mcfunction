return fail

# gu
scoreboard objectives add num dummy

# algol.core
scoreboard objectives add al.player_id dummy
data merge storage algol:player_storage {value: {}}

# algol.cat
scoreboard objectives add al.attack_charge dummy

# algol.dialog
scoreboard objectives add al.dialog.button trigger
scoreboard objectives add al.dialog.form_submission trigger
data merge storage algol:dialog_registry {value: {}}

# cc3
team add cc3.player {translate: "entity.minecraft.player"}
