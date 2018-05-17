# dn: diagnotes utility
function dn
	if test -f dn.sh
    	eval ./dn.sh $argv
	else
		echo "Error: dn.sh not found"
	end
end
