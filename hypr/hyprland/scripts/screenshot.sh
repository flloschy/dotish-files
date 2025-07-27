wayfreeze & PID=$!
IMG="$HOME/Pictures/Screenshots/$(date +"%Y-%m-%d_%I:%M:%S_%p").png"
wayshot -f $IMG -s "$(slurp)"
wl-copy < $IMG
kill $PID
notify-send -u low -t 5000 -i $IMG "Screenshot" "Screenshot saved"
