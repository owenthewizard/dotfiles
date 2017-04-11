[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ -z ${DISPLAY} ]] && [[ "$(tty)" == "/dev/tty1" ]]; then
    startx
    exec clear
fi
