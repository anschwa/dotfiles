################################################################################
#                     Fish is the Friendly Interactive Shell                   #
################################################################################

# No Greeting
set fish_greeting ""

# Homebrew
addpath "/usr/local/bin"

# Tex Path
addpath "/Library/Tex/texbin"

# for Go(lang)
set GOPATH "$HOME/gowork"
addpath "$GOPATH/bin"

# Nginx Path
addpath "/usr/local/nginx/sbin"

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
