[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ ${EUID} -ne 0 ]] && [[ -z ${DISPLAY} ]] && [[ "$(tty)" == "/dev/tty1" ]]; then
    startx -- vt7 || startx
    exec clear
fi
