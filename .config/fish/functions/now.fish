# now: keep track of what you are doing.
# Usage:
#     now "Working on Project A"
#     now pause
#     now continue
#     now done
function now
    echo (date "+%Y-%m-%d %H:%M:%S") - $argv >> $HOME/now.txt
end
