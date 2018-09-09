#!/bin/bash

[[ -f "/etc/X11/xinit/Xresources" ]] && xrdb -load "/etc/X11/xinit/Xresources"
[[ -f "${HOME}/.Xresources" ]] && xrdb -merge "${HOME}/.Xresources"
if [[ -d "/etc/X11/xinit/xinitrc.d" ]]; then
    for f in /etc/X11/xinit/xinitrc.d/?*; do
        [[ -x "${f}" ]] && "${f}"
    done
    unset f
fi

( xrandr | grep -F -q "HDMI-1 connected" ) && xrandr --output HDMI-1 --set "Broadcast RGB" "Full"
numlockx
#"${HOME}/.dotfiles/wallpaper.py" wallpaper 1920x1080
env DESKTOP_SESSION="i3" ${HOME}/Projects/InsprWall/InsprWall.py
xautolock -time 5 -locker 'i3lock -i "${HOME}/.cache/InsprWall/current"' &
compton &
redshift-gtk &
pactl upload-sample /usr/share/sounds/freedesktop/stereo/bell.oga x11-bell
pactl load-module module-x11-bell sample=x11-bell display=$DISPLAY
xset b 100
exec i3
