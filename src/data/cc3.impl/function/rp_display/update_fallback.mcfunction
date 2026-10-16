execute as @e[tag=cc3.rp_display, type=text_display] \
  run function cc3.impl:rp_display/update_fallback/select_lang

schedule function cc3.impl:rp_display/update_fallback 2s replace
