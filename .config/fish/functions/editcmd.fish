# magic editor and filesystem command
function editcmd --description "edit file or list directory"
    set error "Usage: editcmd [mode] <path>"

    switch (count $argv)
        case 1
            set mode $argv[1]
            set path ""
        case 2
            set mode $argv[1]
            set path $argv[2]
        case "*"
            echo $error; return
    end

    if test $mode = "gui"
        switch (uname)
            case Darwin
                if test $path = ""
                    set pwd (pwd)
                    eval emacsclient -n -c $pwd
                else
                    eval emacsclient -n -c $path
                end
            case "*"
                echo "no external editor command is defined"
        end
    else if test $mode = "cli"
        if test $path = ""
            eval ls -lah
        else if test -d $path
            eval cd $path; ls -lah
        else
            eval $EDITOR $path
        end
    else
        echo $error; return
    end
end
