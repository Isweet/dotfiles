#!/bin/bash

dotfiles=$(cd $(dirname $0) && pwd)
old=$(dirname $dotfiles)/dotfiles-old
symlinks=$(find $dotfiles -name '*.symlink' -not -path '*.git/*')

echo "Dotfiles directory is: $dotfiles..."
echo "Old dotfiles will be stored at: $old..."

echo ""

mkdir -p $old

for f in $symlinks; do
    copy_to=".$(basename $f '.symlink')"

    if [ -e $HOME/$copy_to ]; then
        echo "Moving old copy of $HOME/$copy_to to $old/$copy_to..."
        mv $HOME/$copy_to $old
    fi

    echo "Symlinking $HOME/$copy_to to $f..."

    ln -s $f "$HOME/$copy_to"
done
