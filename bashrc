# ~/.bashrc - initialize bash prompt
# Written in 2016 by owenthewizard b9a6135e <at> opayq <dot> com
# Some of this code is written by other authors:
#   joeledwards on GitHub   (no license specified) https://github.com/joeledwards/bashrc/blob/master/bashrc
#   brakertech.com          (no license specified) http://brakertech.com/one-liners/bashrbashrc-tweaks-for-rhel-or-centos/
#   

# NOT ALL OF THIS CODE IS MINE
# CODE THAT IS NOT MINE IS NOT LICENSED UNDER CC0

# Updated to follow the Bash Hackers Wiki "Scripting with Style" guide
# (http://wiki.bash-hackers.org/scripting/style)

[[ $- != *i* ]] && return   # Abort if we aren't interactive

#######################
# Functions/Variables #
#######################

mkvisual() # Creates a lock file after asking the user's prefered $VISUAL
{
    touch ~/.visual
    printf '%s\n' 'Enter your preferred text editor ($VISUAL).'
    printf '%s\n' 'Example: nano, gedit, vim, emacs...'
    printf '%s' "#? "
    read _VISUAL
    printf '%s\n' "export VISUAL=${_VISUAL}" > ~/.visual
}

# Colors
# To use more than 16 colors define them in your terminal or ~/.Xresources
reset="\[\033[0m\]"
black="\[\033[38;5;0m\]"
red="\[\033[38;5;1m\]"
green="\[\033[38;5;2m\]"
yellow="\[\033[38;5;3m\]"
blue="\[\033[38;5;4m\]"
magenta="\[\033[38;5;5m\]"
cyan="\[\033[38;5;6m\]"
white="\[\033[38;5;7m\]"
brightBlack="\[\033[38;5;8m\]"
brightRed="\[\033[38;5;9m\]"
brightGreen="\[\033[38;5;10m\]"
brightYellow="\[\033[38;5;11m\]"
brightBlue="\[\033[38;5;12m\]"
brightMagenta="\[\033[38;5;13m\]"
brightCyan="\[\033[38;5;14m\]"
brightWhite="\[\033[38;5;15m\]"

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
    linux*)     ls_color="--color=auto"
                preserve_root="--preserve-root"
                quoting_style="--quoting-style=escape"
                ;;
    darwin*)    ls_color="-G"
                ;;
    bsd*)       ls_color="-G"
                ;;
    solaris*)   _SUNOS=true
                ;;
    *)          _FALLBACK=true
                ;;
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
alias del='rm -i ${preserve_root}'
alias ln='ln -i'
alias chown='chown ${preserve_root}'
alias chmod='chmod ${preserve_root}'
alias chgrp='chgrp ${preserve_root}'
alias wget='wget -c'                        # Resume wget by default

# Useful stuff
alias ports='netstat -tulanp'               # See listening ports

# Colorize grep and diff (requires colordiff)
alias grep='grep --color=auto'

if command -v colordiff &> /dev/null; then
    alias diff='colordiff'
fi

alias fgrep='grep -F'
alias egrep='grep -E'

# Colorize other stuff
if command -v grc &> /dev/null; then
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

if [[ ${_SUNOS} ]]; then
    alias ls='/usr/gnu/bin/ls -p --color=auto'
else
    alias ls='ls ${ls_color} -p ${quoting_style}'
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

# Color Options
# Set to reset for none/default
userColor=$brightGreen
dirColor=$brightBlue
hostColor=$reset
otherColor=$reset   # Color for extras, like brackets
symbolColor=$reset  # This will turn bright red on error

# Red username for root
[[ $EUID -eq 0 ]] && userColor=$brightRed

# [user@hostname ~/path/to/dir]$  
PS1="$reset$otherColor[$userColor\u$otherColor@$hostColor\h$dirColor \w$otherColor]$symbolColor\\$ $reset"

#vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
