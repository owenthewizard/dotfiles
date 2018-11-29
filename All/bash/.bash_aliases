alias sudo="sudo "
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm ${preserve_root}"
alias mkdir="mkdir -p"
alias ln="ln -i"
alias chown="chown ${preserve_root}"
alias chmod="chmod ${preserve_root}"
alias chgrp="chgrp ${preserve_root}"
alias wget="wget -c"
alias grep="grep --color=auto"
alias fgrep="grep -F"
alias egrep="grep -E"
alias ls="ls ${ls_color}"
alias ll="ls -lh"
alias lh="ls -sh"
alias la="ls -A"

alias del="rm -i"
alias ports="netstat -tulanp"

if ( command -v colordiff &> /dev/null ); then
    alias diff="colordiff"
fi

if ( command -v grc &> /dev/null ); then
    alias ping="grc ping"
    alias gcc="grc gcc"
    alias make="grc make"
    alias last="grc last"
    alias lastb="grc lastb"
    alias mount="grc mount"
    alias ps="grc ps"
    alias ifconfig="grc ifconfig"
    alias df="grc df"
    alias du="grc du"
    alias lsblk="grc lsblk"
fi

if ( command -v pigz &> /dev/null ); then
    alias gzip="pigz"
fi

function mkcd()
{
    mkdir -p "$@"
    shift $(( $# - 1 ))
    cd "$1"
}

function cdtemp()
{
    local temp_dir="$(mktemp -d)"
    [[ -d "$temp_dir" ]] || return 1
    (trap "rm -rf \"$temp_dir\"" EXIT; cd "$temp_dir"; bash --rcfile <(echo "PS1='(temp) $PS1'") -i)
}
