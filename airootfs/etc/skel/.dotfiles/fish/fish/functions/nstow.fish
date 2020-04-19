function nstow
	# Wrapper function for stow thst is looking for targets.stow file
	if [ -f targets.stow ]
		#echo "\"targets.stow\" found. Running"
		if awk '{print $1}' targets.stow | grep $argv[-1]
			set TARGET ( grep $argv[-1] targets.stow | awk '{print $2}' )
			stow -t $TARGET $argv
		else
			stow $argv
		end
	else 
		stow $argv
	end
end
