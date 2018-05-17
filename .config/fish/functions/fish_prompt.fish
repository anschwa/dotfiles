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

    # write prompt to screen
    echo -n "$USER@"(hostname -s)": "
    
    set_color cyan
    echo $new_pwd               # adds newline
    set_color normal

    #echo -n () "~> "
    echo -n (__terlar_git_prompt) "~> "
end
