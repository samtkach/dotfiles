#!/bin/bash
# ---------------------------------------------------------------------------
# setup.sh
#
# A bash script to copy old dotfiles to ~/dotfiles_old and copy the new ones 
# into the home directory. It also fills fills in the gitconfig email from 
# user input.
#
# Maintained by Sam Tkach
# https://github.com/samtkach/dotfiles
# ---------------------------------------------------------------------------



SCRIPT_PATH=`realpath $0`
DIR_PATH=`dirname $SCRIPT_PATH`
OLD_PATH=~/dotfiles_old
FILES=".bashrc .vimrc .gitignore .tmux.conf"

mkdir -p $OLD_PATH

echo "Moving old dotfiles to ~/dotfiles_old and getting new ones...";
echo "Replacing:"

for path in $DIR_PATH/.[^\s][^.]*; do
    bn=`basename $path`;
    mv ~/$bn $OLD_PATH/$bn;
    ln -s $path ~/$bn;
    echo "|--> $bn"
done

read -p "Enter an email address to use with git: " EMAIL
git config --global user.email $EMAIL
echo "Your global git config has been updated."



