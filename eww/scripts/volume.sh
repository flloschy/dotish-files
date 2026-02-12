mic=$(pactl get-source-volume @DEFAULT_SOURCE@ | grep -e "[0-9]*%" -o | head -1)
volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -e "[0-9]*%" -o | head -1)

# remove %
mic=${mic:0:-1}
volume=${volume:0:-1}


echo "{\"mic\": $mic, \"vol\": $volume}"
