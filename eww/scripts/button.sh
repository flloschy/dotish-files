sh ./manage.sh close $1 &

if ([ "$1" = "bluetooth" ]); then
    alacritty -e bluctl &
fi
if ([ "$1" = "wifi" ]); then
    alacritty -e nmcli &
fi
if ([ "$1" = "suspend" ]); then
    systemctl suspend
fi
if ([ "$1" = "reboot" ]); then
    systemctl reboot
fi
if ([ "$1" = "lock" ]); then
   hyprlock
fi
if ([ "$1" = "shutdown" ]); then
    systemctl poweroff
fi
