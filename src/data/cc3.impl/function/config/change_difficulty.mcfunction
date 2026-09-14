execute store result storage cc3:var difficulty int 1 run difficulty
execute if predicate cc3.impl:var_check/difficulty/easy_or_peaceful run difficulty normal
execute if predicate cc3.impl:var_check/difficulty/normal run difficulty hard
execute if predicate cc3.impl:var_check/difficulty/hard run difficulty easy

function cc3.impl:config/refresh_screen
