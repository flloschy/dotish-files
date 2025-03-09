# turn off keyboard light
light -S 255 -s razer/0003:1532:024E.0006/backlight
# turn on red LED on keyboard
light -S 0 -s razer/0003:1532:024E.0006/macro_led

# turn screen on
hyprctl dispatch dpms on
