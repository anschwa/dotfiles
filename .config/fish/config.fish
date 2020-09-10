########################################################################
#                     Fish is the Friendly Interactive Shell           #
########################################################################

set EDITOR vim
set VISUAL vim

# No Greeting
set fish_greeting ""

# Home/bin
addpath "$HOME/bin"
addpath "$HOME/.local/bin"

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

# AWS
addpath "$HOME/.local/bin"

# Plan9 (./plan9/bin/9 acme)
set PLAN9 "$HOME/plan9"
addpath "$PLAN9"

# dotfiles
if command -sq git
    alias dot="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
end

# Misc
alias celar="clear"
alias ll="ls -lah"
alias e="editcmd cli"
alias ee="editcmd gui"
alias d="git diff"
alias s="git status -sb --ignore-submodules"
alias l="git log --graph --pretty=format:\"%C(yellow)%h %C(blue)%ad%C(red)%d %C(reset)%s%C(green) [%cn]\" --decorate --date=short"

# Kubernetes
alias k="kubectl"
