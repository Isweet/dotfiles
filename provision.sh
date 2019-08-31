#!/bin/bash

# This is Ian's personal script for provisioning a new machine.
# It will only work for `bash` on OSX.
# It assumes that this script lives in (and is run from) the .dotfiles repository.

# Dependencies that are in Homebrew Casks
declare -a casks=("google-chrome"
		  "iterm2"
                  "emacs"
		  "virtualbox"
		  "vagrant")

# Dependencies that are in Homebrew
declare -a brews=("git"
		  "stow")

declare -a configs=("bash"
                    "git"
                    "emacs")

# Get Homebrew if it doesn't exist
if ! hash "brew" &> /dev/null ; then
    echo "'brew' not found. Installing..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install all Homebrew Cask dependencies
for dep in "${casks[@]}"; do
    if ! brew cask list "$dep" &> /dev/null ; then
	echo "'$dep' not found. Installing..."
	brew cask install "$dep"
    fi
done

# Install all the Homebrew dependencies
for dep in "${brews[@]}"; do
    if ! brew list "$dep" &> /dev/null ; then
	echo "'$dep' not found. Installing..."
	brew install "$dep"
    fi
done

# Setup configuration files
for conf in "${configs[@]}"; do
    # TODO: how do we check if they are already symlinked?
    stow --target="$HOME" "$conf"
done
