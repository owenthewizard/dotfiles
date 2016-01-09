#!/bin/sh

if [! command -v pwd > /dev/null 2>&1 ]; then
	printf '%s\n' "This script requires 'pwd'."
	exit 127
fi

ln -s $(pwd)/bashrc ~/.bashrc
ln -s $(pwd)/vimrc ~/.vimrc
ln -s $(pwd)/nanorc ~/.nanorc
