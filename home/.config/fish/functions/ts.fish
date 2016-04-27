function ts --description 'create named tmux session'
	tmux new-session -s $argv
end
