#!/bin/bash

# This is Ian's personal script for provisioning a new machine.
# It will only work for `bash` on OSX.
# It assumes that this script lives in (and is run from) the .dotfiles repository.

# Dependencies that are in Homebrew Casks
declare -a casks=("google-chrome"
		  "iterm2"
                  "spotify"
                  "emacs"
		  "virtualbox"
		  "vagrant")

# Dependencies that are in Homebrew
declare -a brews=("git"
                  "go"
		  "stow")

declare -a configs=("bash"
                    "git"
                    "emacs")

declare -a fonts=("source-code-pro")

# Get Homebrew if it doesn't exist
if ! hash "brew" &> /dev/null ; then
    echo "'brew' not found. Installing..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap homebrew/cask-fonts

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

# Install all fonts
for font in "${fonts[@]}"; do
    if ! brew cask list font-"$font" &> /dev/null ; then
        echo "'$font' not found. Installing..."
        brew cask install font-"$font"
    fi
done

# Setup configuration files
for conf in "${configs[@]}"; do
    # TODO: how do we check if they are already symlinked?
    stow --target="$HOME" "$conf"
done

# Go
go get github.com/nsf/gocode
go get github.com/rogpeppe/godef
