[[ $- != *i* ]] && return

export VISUAL="vim"
export EDITOR=${VISUAL}
export SYSTEMD_EDITOR=${VISUAL}

[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases

case ${OSTYPE} in
    linux*)         ls_color="--color=auto"
                    preserve_root="--preserve-root";;
    darwin*|bsd*)   ls_color="-G";;
    *)              case "$(uname -s)" in
                        Linux*)         ls_color="--color=auto"
                                        preserve_root="--preserve-root";;
                        Darwin*|BSD*)   ls_color="-G";;
                    esac;;
esac

alias sudo='sudo '
alias cp='cp -i'
alias mv='mv -i'
alias rm="rm ${preserve_root}"
alias mkdir='mkdir -p'
alias del="rm -i"
alias ln='ln -i'
alias chown="chown ${preserve_root}"
alias chmod="chmod ${preserve_root}"
alias chgrp="chgrp ${preserve_root}"
alias wget='wget -c'
alias grep='grep --color=auto'
alias fgrep='grep -F'
alias egrep='grep -E'
alias ll='ls -lh'
alias lh='ls -sh'
alias la='ls -A'
# The EPA loves us
unset preserve_root ls_color

alias ports='sudo netstat -tulanp'

if ( command -v colordiff &> /dev/null ); then
    alias diff='colordiff'
fi

if ( command -v grc &> /dev/null ); then
    alias ping='grc ping'
    alias gcc='grc gcc'
    alias make='grc make'
    alias last='grc last'
    alias lastb='grc lastb'
    alias mount='grc mount'
    alias ps='grc ps'
    alias ifconfig='grc ifconfig'
    alias df='grc df'
    alias du='grc du'
fi

HISTSIZE=8192
HISTFILESIZE=2048
HISTCONTROL=ignoreboth
HISTTIMEFORMAT="%D - %T : "
HISTIGNORE="history*:exit*:fg:bg"
shopt -s histappend
shopt -s checkwinsize

if [[ "${TERM}" == "rxvt-unicode-256color" ]]; then
        export TERMINAL=urxvtc
        echo -en "\033[3 q"
fi
if [[ "${TERM}" == "linux" ]]; then
  echo -e "
  \e]P0282a2e
  \e]P1a54242
  \e]P28c9440
  \e]P3de935f
  \e]P45f819d
  \e]P585678f
  \e]P65e8d87
  \e]P7707880
  \e]P8373b41
  \e]P9cc6666
  \e]PAb5bd68
  \e]PBf0c674
  \e]PC81a2be
  \e]PDb294bb
  \e]PE8abeb7
  \e]PFc5c8c6
  "
  clear
fi

#vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
