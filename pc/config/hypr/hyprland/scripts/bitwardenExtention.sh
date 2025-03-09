#!/bin/sh

# CREDITS TO JUSTANOTHERARIEL (https://github.com/justanotherariel)
# FOUND HERE: https://github.com/hyprwm/Hyprland/issues/3835#issuecomment-2004448245
# created my updated version based on theirs :)


handle() {
  case $1 in windowtitle*)
      # Remove unnecessary prefix
      window=${1#*>>}
      # If Event includes a title
      if [[ $window == *,* ]]; then
        # get the title
        window_title=${window#*,}
        # extract the id
        window_id=$(echo $window | cut -d "," -f 1)

        # if its a bitwarden window
        if [[ $window_title == *"Extension: (Bitwarden Password Manager)"* ]]; then
            address="address:0x$window_id"
            echo $address

            # hyprctl dispatch setfloating $address
            # hyprctl dispatch resizewindowpixel exact 400 700, $address
            # hyprctl dispatch movewindowpixel "0 -150", $address
            # hyprctl dispatch focuswindow $address

            # VVV Compressed into one call VVV
            
            hyprctl --batch "dispatch setfloating $address ; dispatch resizewindowpixel exact 400 700, $address ; dispatch focuswindow $address"
        fi;
      fi;;

    #   # Fetch the list of windows and parse it using jq to find the window by its decimal ID
    #   window_info=$(hyprctl clients -j | jq --arg address "0x$window_id" '.[] | select(.address == ($id))')

    #   # Extract the title from the window info
    #   window_title=$(echo "$window_info" | jq '.title')

    #   # Check if the title matches the characteristics of the Bitwarden popup window
    #   if [[ "$window_title" == *"(Bitwarden - Free Password Manager) - Bitwarden"* ]]; then
      
    #     # echo $window_id, $window_title
    #     # hyprctl dispatch togglefloating address:0x$window_id
    #     # hyprctl dispatch resizewindowpixel exact 20% 40%,address:0x$window_id
    #     # hyprctl dispatch movewindowpixel exact 40% 30%,address:0x$window_id

    #     hyprctl --batch "dispatch togglefloating address:0x$window_id ; dispatch resizewindowpixel exact 20% 40%,address:0x$window_id ; dispatch movewindowpixel exact 40% 30%,address:0x$window_id"        
    #   fi
    #   ;;
  esac
}

# Listen to the Hyprland socket for events and process each line with the handle function
socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
