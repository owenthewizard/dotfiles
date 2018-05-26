[[ $- != *i* ]] && return

export VISUAL="vim"
export EDITOR="${VISUAL}"
export SYSTEMD_EDITOR="${VISUAL}"
export GTK_MODULES="canberra-gtk-module"
export GTK3_MODULES="canberra-gtk-module"

# xterm-kitty isn't recognized as colorful
[[ "${TERM}" == "xterm-kitty" ]] && force_color="y"

case "${OSTYPE}" in
    linux*)
        if [[ -n "${force_color}" ]]; then
            ls_color="--color=always"
        else
            ls_color="--color=auto"
        fi
        preserve_root="--preserve-root"
        ;;
    *bsd*)
        ls_color="-G"
        ;;
esac

HISTSIZE=500
HISTFILESIZE=1000
HISTCONTROL=ignoreboth
HISTTIMEFORMAT="%D - %T : "
HISTIGNORE="history*:exit*:fg:bg"
shopt -s histappend
shopt -s checkwinsize

[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases
# ~/.bash_custom may override this
[[ -f ~/.bash_custom ]] && source ~/.bash_custom

unset preserve_root ls_color force_color

#vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
