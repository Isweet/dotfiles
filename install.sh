#!/bin/bash

dotfiles=$(cd $(dirname $0) && pwd)

cd $dotfiles

git submodule init
git submodule update

cd -

$dotfiles/bootstrap.sh

ln -s $dotfiles/vim.symlink/vim-pathogen/autoload $dotfiles/vim.symlink/autoload
