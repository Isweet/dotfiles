#!/bin/bash

dotfiles=$(cd $(dirname $0) && pwd)

git submodule init
git submodule update

$dotfiles/bootstrap.sh

ln -s $dotfiles/vim.symlink/vim-pathogen/autoload $dotfiles/vim.symlink/autoload
