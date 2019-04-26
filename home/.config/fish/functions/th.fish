function th --description 'attach to or create tmux session with name of host'
	set HN (hostname -s)
	ta $HN; or ts $HN
end
