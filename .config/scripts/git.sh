#!/bin/sh
COLOR='\033[1;31m'
DIR=~/.config/cnf/

#if any command fails, the shell immediately shall exit
set -e 

echo "checking if dotfiles are up to date.."
if [ -d ~/.config/cnf ]; then
	cd ~/.config/cnf
	git pull --ff-only
else
	echo "no dotfiles found, cloning repo.."
	cd ~/.config
	git clone -b home https://github.com/daniel-palm/cnf ~/.config/cnf
fi

echo -e "${COLOR}dotfiles have been updated in $DIR"
