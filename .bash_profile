# .bash_profile

############################## Define Colors ###################################
# Reset
Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Example:
#  echo -e "${blue}test"
################################################################################

# A nice one-line prompt
# export PS1="\u@\h[${Cyan}\W${Color_Off}]\\$ "

# A Much Better Two-Line Prompt:
# Causes some problems with certian direcotry it seems.
PROMPT() {
    # for displaying the path
    pwd_length=14
    pwd_symbol="..."
    newPWD="${PWD/#$HOME/~}"
    if [ $(echo -n $newPWD | wc -c | tr -d " ") -gt $pwd_length ]
    then
        newPWD=$(echo -n $newPWD | awk -F '/' '{
   print $1 "/" $2 "/.../" $(NF-1) "/" $(NF)}')
    fi

    # generate the prompt
    PS1_PATH=$(printf "%s" ${Cyan}$newPWD)    # needed to escape spaces in directories
    PS1_NAME="\[$Color_Off\]\u@\h:"
    PS1_CMD="\[$Color_Off\]\!-$"    # command history number

    # with columns
    #PS1=$(printf "%${COLUMNS}s\r%s\n%s " $PS1_PATH $PS1_NAME $PS1_CMD)

    # no columns (and colors)
    PS1=$(printf "%s %s\n%s " $PS1_NAME $PS1_PATH $PS1_CMD)
}
PROMPT_COMMAND=PROMPT

# Homebrew PATH
# looks like /usr/local/bin/ is already set
#export PATH="/usr/local/bin":${PATH}

# Add Completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Colorful ls and grep
export GREP_OPTIONS='--color=auto'

# autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# pass completion (currently broken)
if [ -d /usr/local/Cellar/pass ]; then
	source /usr/local/etc/bash_completion.d/pass
fi

# Tex Path
TEXPATH="/Library/Tex/texbin"
if [ -d "$TEXPATH" ]; then
	export PATH="${TEXPATH}":${PATH}
fi

# for Go(lang)
export GOPATH="$HOME/gowork"
if [ -d "$GOPATH" ]; then
	export PATH="${GOPATH}/bin:${PATH}"
fi

# Emacs Cask Path
CASK="$HOME/.cask/bin"
if [ -d "$CASK" ]; then
    export PATH="${CASK}:${PATH}"
fi

# Nginx Path
MY_NGINX="/usr/local/nginx/sbin"
if [ -d "$MY_NGINX" ]; then
	export PATH="${MY_NGINX}:${PATH}"
fi

# Custom Alias Commands
alias please='sudo "$BASH" -c "$(history -p !!)"'
alias celar="clear"
alias mkdir="mkdir -p"
alias tty-clock="tty-clock -scbC 4"
alias OSXey="OSXey -c"

# alias for Python
alias python="python3"
alias pip="pip3"
# Enable virtualenvwrapper
VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export WORKON_HOME=$HOME/python_envs
source /usr/local/bin/virtualenvwrapper.sh

# alias for emacs
alias emacs-debug="/Applications/Emacs.app/Contents/MacOS/Emacs --debug-init"
alias emacs-gui="emacsclient -n -c -a ''"
alias emacs-exit="emacsclient -e '(kill-emacs)'"
alias emacs=emacs-gui

# Custom Commands / Functions

# now: keep track of what you are doing.
# Usage:
#     now "Working on Project A"
#     now pause
#     now continue
#     now done
function now {
    echo $(date "+%Y-%m-%d %H:%M:%S") - "$@" >> $HOME/now.txt
}

function e() {
	# cd to directory or open in editor
	if [ -d "$1" ] || [[ $# -eq 0 ]]; then
		cd "$1" && ls
	else
		vim "$1"
	fi 	
}

function mkcd {
    # Make a directory and change to it.
    mkdir -p "$1" && cd "$1"
}

function sec {
    # Convert seconds since UNIX Epoch to a readable date.
    date -j -r "$1"
}

function ms {
    # Convert milliseconds since UNIX Epoch to a readable date.
    date -j -r "$(($1/1000))"
}

function randpw {
    # Generate a random password of a given length.
    < /dev/urandom LC_ALL=C tr -dc _A-Z-a-z-0-9 | head -c${1:- 32};echo;
}

function play {
    # Skip DASH manifest for speed purposes. This might actually disable
    # being able to specify things like 'bestaudio' as the requested format,
    # but try anyway.
    # Get the best audio that isn't WebM, because afplay doesn't support it.
    # Use "$*" so that quoting the requested song isn't necessary.
    youtube-dl --default-search=ytsearch: \
               --youtube-skip-dash-manifest \
               --output="${TMPDIR:-/tmp/}%(title)s-%(id)s.%(ext)s" \
               --restrict-filenames \
               --format="bestaudio[ext!=webm]" \
               --exec=afplay "$*"
}

function mp3 {
    # Get the best audio, convert it to MP3, and save it to the current
    # directory.
    youtube-dl --default-search=ytsearch: \
               --restrict-filenames \
               --format=bestaudio \
               --extract-audio \
               --audio-format=mp3 \
               --audio-quality=1 "$*"
}

