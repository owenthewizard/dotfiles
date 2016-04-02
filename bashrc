# ~/.bashrc - initialize bash prompt
# Written in 2016 by owenthewizard b9a6135e <at> opayq <dot> com
# Some of this code is written by other authors:
#   joeledwards on GitHub   (no liscense specified) https://github.com/joeledwards/bashrc/blob/master/bashrc
#   brakertech.com          (no liscense specified) http://brakertech.com/one-liners/bashrbashrc-tweaks-for-rhel-or-centos/
#   

# NOT ALL OF THIS CODE IS MINE
# CODE THAT IS NOT MINE IS NOT LICENSED UNDER CC0

# Updated to follow the Bash Hackers Wiki "Scripting with Style" guide
# (http://wiki.bash-hackers.org/scripting/style)

[[ $- != *i* ]] && return                   # Abort if we aren't interactive

#######################
# Functions/Variables #
#######################

mkvisual() # Creates a lock file after asking the user's prefered $VISUAL

{
    touch ~/.visual
    read -p 'Enter your preferred text editor ($VISUAL) in quotes. i.e. "nano", "gedit", "vim", "emacs"... ' _VISUAL
    printf '%s\n' "export VISUAL=${_VISUAL}" > ~/.visual
}

#########################
# Text Editor ($VISUAL) #
######################### 

if [[ -f ~/.visual ]]; then 
    source ~/.visual
else
    mkvisual
    source ~/.visual
fi

export EDITOR=${VISUAL}                         # Legacy $VISUAL
export SYSTEMD_EDITOR=${VISUAL}

##################
# Custom Aliases #
##################
# A place for user-defined aliases that should not be shipped by default

if [[ -f ~/.bash_aliases ]]; then
    source ~/.bash_aliases
fi

##############
# OS Support #
##############
case ${OSTYPE} in
    linux*)     ls_color="--color=auto" ;;
    darwin*)    ls_color="-G" ;;
    bsd*)       ls_color="-G" ;;
    solaris*)   _SUNOS=true ;;
    *)      _FALLBACK=true ;;
esac

if [[ ${_FALLBACK} ]]; then
    case "$(uname -s)" in
        Linux*)     ls_color="--color=auto" ;;
        Darwin*)    ls_color="-G" ;;
        *BSD)       ls_color="-G" ;;
        SunOS*)     _SUNOS=true ;;
    esac
fi

#########################
# Aliases               #
#########################

alias sudo='sudo '                          # Fix sudo to work with aliases
# A few protective measures...
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias del='rm -i --preserve-root'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias wget='wget -c'                        # Resume wget by default

alias ports='netstat -tulanp'               # See listening ports

# Colorize grep and diff (requires colordiff)
alias grep='grep --color=auto'
if command -v colordiff &> /dev/null; then
    alias diff='colordiff'
fi

alias fgrep='grep -F'
alias egrep='grep -E'

if [[ ${_SUNOS} ]]; then
    alias ls='/usr/gnu/bin/ls -p --color=auto'
else
    alias ls='ls ${ls_color} -p --quoting-style=escape'
fi

alias ll='ls -lh'
alias lh='ls -sh'
alias la='ls -A'

#########################
# History               #
#########################

HISTSIZE=8192
HISTFILESIZE=2048
HISTCONTROL=ignoreboth
# Lines beginning with spaces and blank lines are ignored
HISTTIMEFORMAT="%D - %T : "
HISTIGNORE="history*:exit*:fg:bg"
shopt -s histappend
shopt -s checkwinsize

#########################
# Prompt                #
#########################


# Red username for root
if [[ $EUID -eq 0 ]]; then
    userColor="38;5;1m"
else
    userColor="38;5;2m"
fi

# Red symbol if exit != 0
# [user@hostname ~/path/to/dir]$ 

#FIXME PS1="[\[$(tput sgr0)\]\[\033[$userColor\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\h \[$(tput sgr0)\]\[\033[38;5;4m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]]\`if [[ ${?} -ne 0 ]]; then echo -ne '\[\e[38;5;1m\]'; fi\`\\$\[$(tput sgr0)\] "
PS1="[\[$(tput sgr0)\]\[\033[$userColor\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\h \[$(tput sgr0)\]\[\033[38;5;4m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]]\\$\[$(tput sgr0)\] "

#vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
