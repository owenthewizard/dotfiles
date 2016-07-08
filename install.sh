#!/usr/bin/env bash

# Interactively install dotfiles

dir="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
function chdir()    # Make sure we are in the directory with the dotfiles
{
    cd ${dir}
}
chdir

# Get list of files to install
programs=*rc
programs+=" Xresources"

for i in $programs; do
    printf '%s\n' "Do you wish to install ~/.${i}?"
    select yn in "Yes" "No"; do
        case ${yn} in
            Yes )   ln -sf ${dir}/${i} ~/.${i};
                    break
                ;;
            No  )   break
                ;;
        esac
    done
done
