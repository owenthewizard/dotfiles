[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ ${EUID} -ne 0 ]] && [[ -z ${DISPLAY} ]] && [[ "$(tty)" == "/dev/tty1" ]]; then
    startx
    exec clear
fi
