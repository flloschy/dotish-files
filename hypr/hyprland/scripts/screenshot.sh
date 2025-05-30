hyprpicker -r -z &
sleep 0.1
IMG="/home/floschy/Pictures/Screenshots/$(date +"%Y-%m-%d_%I:%M:%S_%p").png"
hyprctl keyword layerrule "noanim,selection" >/dev/null
wayshot -f $IMG -s "$(slurp)"
wl-copy < $IMG
pkill hyprpicker
notify-send -u low -t 5000 "Screenshot" "Screenshot saved"
