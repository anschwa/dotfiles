# fish is the friendly interactive shell

# No Greeting
set fish_greeting ""

# Two-Line Prompt
function fish_prompt -d "overwrite prompt"
	set pwd_len 14
    
    set new_pwd (pwd)
    if [ new_pwd = $HOME ]
        set new_pwd "~/"
    end

    set check_len (echo -n $new_pwd | wc -c)
    if [ $check_len -gt $pwd_len ]
        set new_pwd (echo -n $new_pwd | awk -F '/' '{print $1 "/" $2 "/.../" $(NF-1) "/" $(NF)}')
    end

	set prompt "~> "
    echo "$USER@"(hostname -s)": "(set_color cyan)"$new_pwd"
    echo -n $prompt
end

# autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish
