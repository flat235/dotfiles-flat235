function fixsshagent --description 'fix ssh agent by updating env var from tmux session env'
	export (tmux showenv SSH_AUTH_SOCK)
end

