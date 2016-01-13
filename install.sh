#!/bin/bash

read -n 1 -p 'Do you wish to install/upgrade "~/.bashrc"? (y/N) ' bashyn 
[[ -z "$bashyn" ]] && bashyn=n
case "$bashyn" in
	y|Y )	ln -sf $(pwd)/bashrc ~/.bashrc ;;	
esac

echo

read -n 1 -p 'Do you wish to install/upgrade "~/.nanorc"? (y/N) ' nanoyn
[[ -z "$nanoyn" ]] && nanoyn=n
case "$nanoyn" in
	y|Y )	ln -sf $(pwd)/nanorc ~/.nanorc ;;
esac

echo

read -n 1 -p 'Do you wish to install/upgrade "~/.vimrc"? (y/N) ' vimyn
[[ -z "$vimyn" ]] && vimyn=n
case "$vimyn" in
	y|Y ) ln -sf $(pwd)/vimrc ~/.vimrc ;;
esac

echo
exit 0
