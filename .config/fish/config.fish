################################################################################
#                     Fish is the Friendly Interactive Shell                   #
################################################################################

# No Greeting
set fish_greeting ""

# Homebrew
addpath "/usr/local/bin"

# Tex Path
addpath "/Library/Tex/texbin"

# Roswell (common lisp)
addpath "$HOME/.roswell/bin"

# Go(lang)
set GOPATH "$HOME/gowork"
addpath "$GOPATH/bin"

# Rust
addpath "$HOME/.cargo/bin"

# Plan9 (./plan9/bin/acme)
set PLAN9 "$HOME/plan9"
addpath "$PLAN9"

# Nginx Path
addpath "/usr/local/nginx/sbin"

# Postgres Path
addpath "/Library/PostgreSQL/10/bin"

# autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

# dotfiles
if command -sq git
    alias dot="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
end

# Misc
alias celar="clear"
alias ll="ls -lh"

# Python
alias python="python3"
alias pip="pip3"
# virtualfish provides a nice wrapper for virtualenv in fish

# Emacs
alias emacs-debug="/Applications/Emacs.app/Contents/MacOS/Emacs --debug-init"
alias emacs-gui="emacsclient -n -c -a ''"
alias emacs-exit="emacsclient -e '(kill-emacs)'"
alias emacs=emacs-gui
