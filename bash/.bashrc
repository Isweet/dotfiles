LSCOLORS="exfxcxdxbxegedabagacad"
export LSCOLORS
alias ls="ls -G"

if which reattach-to-user-namespace &> /dev/null; then
    alias open="reattach-to-user-namespace open"
fi

MYTMUXCONF="~/.tmux.conf"
export MYTMUXCONF

