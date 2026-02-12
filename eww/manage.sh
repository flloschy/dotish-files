startAnimation=("target bars volume ram player tray updates shutdown reboot wifi cputemp time lock suspend bluetooth")
closeAnimation=("bluetooth suspend lock time cputemp wifi reboot shutdown updates tray player ram volume bars target")
closeFromBluetooth=("bluetooth cputemp time suspend wifi bars reboot lock volume shutdown player updates tray ram target")
closeFromSuspend=("suspend bluetooth lock reboot wifi shutdown time cputemp player tray bars volume ram updates target")
closeFromLock=("lock shutdown suspend player tray reboot bluetooth time wifi cputemp bars ram volume updates target")
closeFromWifi=("wifi bluetooth cputemp reboot suspend time bars lock shutdown tray player volume ram updates target")
closeFromReboot=("reboot wifi suspend shutdown lock bluetooth cputemp time player tray bars volume ram updates target")
closeFromShutdown=("shutdown reboot lock tray wifi suspend time player cputemp bluetooth ram volume bars updates target")


action=$1
target=$2


if ([ $# -eq 0 ]); then
    action="close"
    if ([ $(eww active-windows | wc -l) -eq 1 ]); then
        action="open"
    fi
fi

echo $action

if ([ "$action" = "open" ]); then
    for widget in $startAnimation
    do
        eww open $widget
        # sleep 0.01
    done
    # yay -Sy
    eww update pendingupdates="$(yay -Qu | wc -l)"
else
    if ([ "$action" = "close" ]); then
        animation=$closeAnimation

        if ([ "$target" = "bluetooth" ]); then
            animation=$closeFromBluetooth
        fi
        if ([ "$target" = "suspend" ]); then
            animation=$closeFromSuspend
        fi
        if ([ "$target" = "lock" ]); then
            animation=$closeFromLock
        fi
        if ([ "$target" = "wifi" ]); then
            animation=$closeFromWifi
        fi
        if ([ "$target" = "reboot" ]); then
            animation=$closeFromReboot
        fi
        if ([ "$target" = "shutdown" ]); then
            animation=$closeFromShutdown
        fi


        for widget in $animation
        do
            eww close $widget
            # sleep 0.01
        done
    fi
fi
