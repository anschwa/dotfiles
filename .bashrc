#!/bin/bash

# Ignore duplicate history entries and allow for more entries
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=-1
HISTFILESIZE=10000

# Add ISO 8601 datestring to command
export HISTTIMEFORMAT="%Y-%m-%d_%H:%M:%S "
export HISTFILE="$HOME/.bash_history"

shopt -q -s cmdhist  # Make multi-line commandsline in history
shopt -s checkwinsize  # Make sure display get updated when terminal window get resized
shopt -s histappend histreedit histverify

# PATH
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "/usr/local/go/bin" ] && PATH="$PATH:/usr/local/go/bin"

export PATH

# ALIASES
alias ll="ls -lah"
alias dot="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

# PROMPT
if [ -f "$HOME/.git-prompt.sh" ]
then
    . "$HOME/.git-prompt.sh"

    GIT_PS1_SHOWCOLORHINTS=true
    GIT_PS1_SHOWDIRTYSTATE=true
    GIT_PS1_SHOWUNTRACKEDFILES=true
    PROMPT_COMMAND='__git_ps1 "\u@\h:\w" \\n"\\\$ "'
fi

# MISC
# Configuration for fzf (https://github.com/junegunn/fzf)

# Add keybindings for navigating shell history
# C-r: search bash_history
# C-t: insert  from $PWD
# M-c: cd into selected directory
[ -f /usr/share/fzf/shell/key-bindings.bash ] && . /usr/share/fzf/shell/key-bindings.bash

# Emacs
emacsStart() {
    emacsclient --create-frame --alternate-editor=""
}

emacsExit() {
    emacsclient -n -e '(kill-emacs)'
}

emacsFrame() {
    emacsclient -nc
}

# Password Generator
randpw() {
    len=16
    if [ -n "$1" ]; then
        len="$1"
    fi

    env LC_CTYPE=C tr -dc "_a-zA-Z0-9-" < /dev/urandom | fold -w "$len" | head -n 1
}
