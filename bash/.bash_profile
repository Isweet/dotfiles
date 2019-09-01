# PROMPT
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# LS colors
export LSCOLORS="exfxcxdxbxegedabagacad"

# Go
export GOPATH="$HOME/Projects/go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"

# opam configuration
test -r /Users/ins/.opam/opam-init/init.sh && . /Users/ins/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

#
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
