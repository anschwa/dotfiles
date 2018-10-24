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

