#!/bin/bash
# ---------------------------------------------------------------------------
# setup.sh
#
# A bash script to copy old files to ~/dotfiles_old and copy the new ones 
# into the home directory.
#
# Maintained by Sam Tkach
# https://github.com/samtkach/dotfiles
# ---------------------------------------------------------------------------



set -e

dir=dirname "$(readlink -f "$0")"
olddir=~/dotfiles_old


echo "Moving old dotfiles to ~/dotfiles_old and getting new ones...";
echo "Replacing:"

for path in $dir/.*; do
    bn=basename $path;
    mv ~/$bn ~/$olddir/$bn;
    ln -s path ~/$bn;
    echo "|--> $(bn)"
done

echo "Done."

