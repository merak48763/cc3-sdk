function cc3.impl:tick/player/adventure_mode

execute if predicate cc3.impl:should_join_player_team \
  run return run team join cc3.player @s
team leave @s
