#!/bin/bash

# BETTER DEFAULTS
# Ignore duplicate history entries and allow for more entries
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=10000
HISTFILESIZE=10000

# Add ISO 8601 datestring to command
export HISTTIMEFORMAT="%Y-%m-%d_%H:%M:%S "
export HISTFILE="$HOME/.bash_history"

shopt -q -s cmdhist  # Make multi-line commandsline in history
shopt -s checkwinsize  # Make sure display get updated when terminal window get resized
shopt -s histappend histreedit histverify

# Enable all bash completions
[ -f /etc/profile.d/bash_completion.sh ] && source /etc/profile.d/bash_completion.sh

# EDITOR
export VISUAL="vi"
export EDITOR="vi"

# PATH
# Start fresh
[ -d "/sbin" ] && PATH="/sbin"
[ -d "/bin" ] && PATH="/bin:$PATH"
[ -d "/usr/sbin" ] && PATH="/usr/sbin:$PATH"
[ -d "/usr/bin" ] && PATH="/usr/bin:$PATH"
[ -d "/usr/local/sbin" ] && PATH="/usr/local/sbin:$PATH"
[ -d "/usr/local/bin" ] && PATH="/usr/local/bin:$PATH"

# Personal use
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

# Go(lang)
[ -d "/usr/local/go/bin" ] && PATH="$PATH:/usr/local/go/bin"
[ -d "$HOME/go" ] && export GOPATH="$HOME/go"
[ -d "$HOME/go/bin" ] && export GOBIN="$HOME/go/bin"
[ -n "$GOBIN" ] && PATH="$PATH:$GOBIN"

# Rust
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# Fly.io (flyctl)
[ -d "$HOME/.fly" ] && PATH="$PATH:$HOME/.fly/bin"

# Done with $PATH
export PATH

# ALIASES
alias ls="ls -Alph --color"
alias dot="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias emacs-start="emacs --daemon"
alias emacs-exit="emacsclient -n -e '(kill-emacs)'"
alias ee="emacsclient -nc"
! [ -x "$(command -v open)" ] && alias open="xdg-open"

# PROMPT
if [ -f "$HOME/.git-prompt.sh" ]
then
    source "$HOME/.git-prompt.sh"

    GIT_PS1_SHOWCOLORHINTS=true
    GIT_PS1_SHOWDIRTYSTATE=true
    GIT_PS1_SHOWUNTRACKEDFILES=true
    PROMPT_COMMAND='__git_ps1 "\u@\h:\w" \\n"\\\$ "'
fi

# Configuration for fzf (https://github.com/junegunn/fzf)
# First make sure fd (https://github.com/sharkdp/fd) is installed:
if [ -x "$(command -v fd)" ] && [ -x "$(command -v fzf)" ]
then
    export FZF_DEFAULT_COMMAND="fd --color=never --exclude=node_modules --exclude=vendor"

    # These are the default fzf keybindings:
    #   C-r: search bash_history
    #   C-t: insert  from $PWD
    #   M-c: cd into selected directory
    [ -f /usr/share/fzf/shell/key-bindings.bash ] && source /usr/share/fzf/shell/key-bindings.bash

    # I only want history navigation, so this is how I'm restoring the
    # default keybindings to C-t and M-c
    bind -r "\C-t" && bind -m emacs-standard '"\C-t":transpose-chars'
    bind -r "\ec" && bind -m emacs-standard '"\ec":capitalize-word'

    complete -o bashdefault -o default -F _fzf_path_completion ee
fi

# FUNCTIONS
# 3-in-1: ls, cd, and edit as one command!
e() {
    # No arguments is a regular 'ls'
    [ "$#" -eq 0 ] && ls -Alph --color && return

    # If $1 is a directory, cd then list all files
    if [ "$#" -eq 1 ]
    then
        [ -d "$1" ] && cd "$1" && ls -lh --color && return
    fi

    # Otherwise, open all files to edit
    $EDITOR "$@"
}

# Password Generator
randpw() {
    len=16
    [ -n "$1" ] && len="$1"
    LC_CTYPE=en.US.UTF-8 tr -dc "_a-zA-Z0-9-" < /dev/urandom | fold -w "$len" | head -n 1
}
