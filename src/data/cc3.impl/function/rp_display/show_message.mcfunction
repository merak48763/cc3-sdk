# TODO: add real RP download link
tellraw @s { \
  translate: "text.cc3.thing", fallback: "%2$s", \
  with: [ \
    { \
      translate: "text.cc3.resourcepack.message", \
      with: [ \
        {translate: "text.cc3.resourcepack.lang", color: "#88ff88"}, \
        {text: "[?]", color: "blue", underlined: true, hover_event: {action: "show_text", value: {translate: "text.cc3.resourcepack.lang_info"}}} \
      ] \
    }, \
    {text: "https://youtu.be/dQw4w9WgXcQ", color: "blue", underlined: true, click_event: {action: "open_url", url: "https://youtu.be/dQw4w9WgXcQ"}} \
  ] \
}
