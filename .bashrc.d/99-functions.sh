#!/bin/bash

# Emacs
emacsStart() {
    emacsclient --create-frame --alternate-editor=""
}

emacsStop() {
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
