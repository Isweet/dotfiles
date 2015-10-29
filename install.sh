#!/bin/bash

dotfiles=$(cd $(dirname $0) && pwd)

ln -s $dotfiles/vim.symlink/vim-pathogen/autoload $dotfiles/vim.symlink/autoload
