# owenthewizard's ~/.bashrc
# Some of this is from...
# joeledwards's bashrc on GitHub
# brakertech.com/one-liners/bashrbashrc-tweaks-for-rhel-or-centos
# 

# Only run if shell is interactive
[[ $- != *i* ]] && return

## TEXT EDITOR
# Creates a lock file after asking the user's prefered $VISUAL

if [[ -f ~/.visual ]]; then
	source ~/.visual
else
	touch ~/.visual && chmod u+x ~/.visual
	read -p 'Enter your preffered text editor ($VISUAL) in quotes. i.e. "nano", "gedit", "vim", "emacs"... ' _VISUAL
	printf '%s\n' "export VISUAL="$_VISUAL"" > ~/.visual
	source ~/.visual
fi
export EDITOR="$VISUAL"
export SYSTEMD_EDITOR="$VISUAL"

## CUSTOM ALIASES
# A place for user-defined aliases that should not be shipped by default

if [[ -f ~/.bash_aliases ]]; then
	source ~/.bash_aliases
fi

## 256 COLORS
#TODO

## COLORS
# Regular Colors (from https://wiki.archlinux.org/index.php/Color_Bash_Prompt#List_of_colors_for_prompt_and_Bash)
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Underline
UBlack='\e[4;30m'       # Black
URed='\e[4;31m'         # Red
UGreen='\e[4;32m'       # Green
UYellow='\e[4;33m'      # Yellow
UBlue='\e[4;34m'        # Blue
UPurple='\e[4;35m'      # Purple
UCyan='\e[4;36m'        # Cyan
UWhite='\e[4;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

# High Intensity
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White

# Bold High Intensity
BIBlack='\e[1;90m'      # Black
BIRed='\e[1;91m'        # Red
BIGreen='\e[1;92m'      # Green
BIYellow='\e[1;93m'     # Yellow
BIBlue='\e[1;94m'       # Blue
BIPurple='\e[1;95m'     # Purple
BICyan='\e[1;96m'       # Cyan
BIWhite='\e[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\e[0;100m'   # Black
On_IRed='\e[0;101m'     # Red
On_IGreen='\e[0;102m'   # Green
On_IYellow='\e[0;103m'  # Yellow
On_IBlue='\e[0;104m'    # Blue
On_IPurple='\e[10;95m'  # Purple
On_ICyan='\e[0;106m'    # Cyan
On_IWhite='\e[0;107m'   # White

## OS
case "$OSTYPE" in
	linux*)		ls_color="--color=auto" ;;
	darwin*)	ls_color="-G" ;;
	bsd*)		ls_color="-G" ;;
	solaris*)	_SUNOS=true ;;
	*)		_FALLBACK=true ;;
esac

if [[ "$_FALLBACK" ]]; then
	case "$(uname -s)" in
		Linux*)		ls_color="--color=auto" ;;
		Darwin*)	ls_color="-G" ;;
		*BSD)		ls_color="-G" ;;
		SunOS*)		_SUNOS=true ;;
	esac
fi

#########################
# Aliases				#
#########################

alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
#alias rm='rm -i --preserve-root'
#alias rm='trash'
#alias rm='printf %s\n "Use trash."'
alias del='rm -i --preserve-root'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias wget='wget -c'
alias ports='netstat -tulanp'

# Colorize grep and diff (requires colordiff)
alias grep='grep --color=auto'
if command -v colordiff &> /dev/null; then
	alias diff='colordiff'
fi

alias fgrep='grep -F'
alias egrep='grep -E'

if [[ "$_SUNOS" ]]; then
	alias ls='/usr/gnu/bin/ls -p --color=auto'
else
	alias ls='ls ${ls_color} -p --quoting-style=escape'
fi

alias ll='ls -lh'
alias lh='ls -sh'
alias la='ls -A'

#########################
# History				#
#########################

HISTSIZE=8192
HISTFILESIZE=2048
HISTCONTROL=ignoreboth # Lines beginning with spaces and blank lines are ignored
HISTTIMEFORMAT="%D - %T : "
HISTIGNORE="history*:exit*:fg:bg"
shopt -s histappend
shopt -s checkwinsize

#########################
# Prompt				#
#########################

# Fix xfce4-terminal to support 256 colors
#FIXME
#if [[ $(ps -o comm= -p "$(($(ps -o ppid= -p "$(($(ps -o sid= -p "$$")))")))" == "xfce4-terminal" ]]; then
#	TERM=xterm-256color
#fi
#
if [[ "$TERM" == "xterm-256color" ]] || [[ $(tput colors) -eq 256 ]]; then # Nicer 256 colour prompt
	if [[ "$EUID" -eq 0 ]]; then
		PS1="\[$(tput sgr0)\][\[\033[38;5;1m\]\u\\[$(tput sgr0)\]@\h \[\033[38;5;4m\]\w\[$(tput sgr0)\]]\\$ \[$(tput sgr0)\]"
	else
		PS1="\[$(tput sgr0)\][\[\033[38;5;2m\]\u\\[$(tput sgr0)\]@\h \[\033[38;5;4m\]\w\[$(tput sgr0)\]]\\$ \[$(tput sgr0)\]"
	fi
else # Uglier 8 colour prompt
	if [[ "$EUID" -eq 0 ]]; then
		PS1="[\[\e[31m\]\u\[\e[m\]@\h \[\e[34m\]\w\[\e[m\]]\\$ "
	else
		PS1="[\[\e[32m\]\u\[\e[m\]@\h \[\e[34m\]\w\[\e[m\]]\\$ "
	fi
fi

#vim: set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
