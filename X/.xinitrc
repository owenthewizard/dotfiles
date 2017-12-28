#!/bin/bash

[[ -f /etc/X11/xinit/Xresources ]] && xrdb -load /etc/X11/xinit/Xresources
[[ -f "${HOME}"/.Xresources ]] && xrdb -merge "${HOME}"/.Xresources

if [[ -d /etc/X11/xinit/xinitrc.d ]]; then
    for f in /etc/X11/xinit/xinitrc.d/?*; do
        [[ -x "${f}" ]] &&  "${f}"
    done
    unset f
fi

#xrandr --output HDMI-A-1 --off
(xrandr | grep -F "HDMI-1 connected" &> /dev/null) && xrandr --output HDMI-1 --set "Broadcast RGB" "Full"
numlockx
urxvtd -q -f -o
feh --no-fehbg --image-bg black --bg-center "${HOME}"/Pictures/.wallpaper.png --xinerama-index 0
xautolock -time 10 -locker 'i3lock-next "Type password to unlock" "Open Sans" 24' &
redshift-gtk &
#compton -b
exec i3
