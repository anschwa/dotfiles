function addpath
    if [ -d $argv[1] ]
        set PATH $argv[1] $PATH
    end
end
