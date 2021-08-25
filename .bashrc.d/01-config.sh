#!/usr/bin/bash

# ALIASES
alias ll="ls -lah"
alias dot="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

# PATHS

# MISC
# Configuration for fzf (https://github.com/junegunn/fzf)

# Add keybindings for navigating shell history
# C-r: search bash_history
# C-t: insert  from $PWD
# M-c: cd into selected directory
[ -f /usr/share/fzf/shell/key-bindings.bash ] && . /usr/share/fzf/shell/key-bindings.bash
