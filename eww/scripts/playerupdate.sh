status=$(playerctl status)

if ([ "$status" = "Stopped" ]); then
    echo "{\"t\": \", \"a\": \", \"i\": \", \"l\": 1, \"p\": 0, \"s\": \"Paused\", \"m\": \"00:00\", \"c\": \"00:00\"}"
else 
    title=$(playerctl metadata title)
    # replace ' with "
    title=$(echo $title | sed "s/\"/'/g")
    artist=$(playerctl metadata artist)
    image=$(playerctl metadata mpris:artUrl)
    length=$(playerctl metadata mpris:length)
    position=$(playerctl position)
    position=${position%.*}
    position=$((position * 1000000))

    max=$(date -d@$((length/1000000)) -u +%M:%S)
    current=$(date -d@$((position/1000000)) -u +%M:%S)
    # notify-send "boo" "{\"t\":\"${title}\", \"a\": \"$artist\", \"i\":\"$image\", \"l\":$length, \"p\": $position, \"s\": \"$status\"}"
    echo "{\"t\":\"${title}\", \"a\": \"$artist\", \"i\":\"$image\", \"l\":$length, \"p\": $position, \"s\": \"$status\", \"m\": \"$max\", \"c\": \"$current\"}"
fi
