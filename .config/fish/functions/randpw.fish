# generate random password of length n

function randpw
	set len 16
	if test (count $argv) -eq 1
		set len $argv[1]
	end

	cat /dev/urandom | env LC_CTYPE=C tr -dc "_a-zA-Z0-9-" | fold -w $len | head -n 1
end
