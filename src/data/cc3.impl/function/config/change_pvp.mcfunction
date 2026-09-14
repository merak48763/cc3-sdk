execute store result storage cc3:var difficulty int 1 run gamerule pvp
execute if predicate cc3.impl:var_check/pvp/off run gamerule pvp true
execute if predicate cc3.impl:var_check/pvp/on run gamerule pvp false

function cc3.impl:config/refresh_screen
