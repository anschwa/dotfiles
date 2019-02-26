################################################################################
#                     Fish is the Friendly Interactive Shell                   #
################################################################################

set EDITOR vim

# No Greeting
set fish_greeting ""

# Home/bin
addpath "$HOME/bin"

# Homebrew
addpath "/usr/local/bin"

# Tex Path
addpath "/Library/Tex/texbin"

# Roswell (common lisp)
addpath "$HOME/.roswell/bin"

# Go(lang)
if test -x /usr/local/go/bin/go
  addpath /usr/local/go/bin
end

set GOPATH "$HOME/go"
set GOBIN "$GOPATH/bin"
addpath $GOBIN

# Rust
addpath "$HOME/.cargo/bin"

# Nginx Path
addpath "/usr/local/nginx/sbin"
addpath "/usr/sbin"

# Postgres Path
addpath "/Library/PostgreSQL/10/bin"

# Plan9 (./plan9/bin/acme)
set PLAN9 "$HOME/plan9"
addpath "$PLAN9"

# autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

# dotfiles
if command -sq git
    alias dot="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
end

# Misc
alias celar="clear"
alias ll="ls -lah"
alias e="editcmd cli"
alias ee="editcmd gui"

# Python
alias python="python3"
alias pip="pip3"
# virtualfish provides a nice wrapper for virtualenv in fish

# Emacs
alias emacs-debug="/Applications/Emacs.app/Contents/MacOS/Emacs --debug-init"
alias emacs-gui="emacsclient -n -c -a ''"
alias emacs-exit="emacsclient -e '(kill-emacs)'"
alias emacs=emacs-gui

# Kubernetes
alias k="kubectl"
