# save emacs!
if [[ "$TERM" == "dumb" ]]
then
	unsetopt zle
	unsetopt prompt_cr
	unsetopt prompt_subst
	unfunction precmd
	unfunction preexec
	PS1='$ '
fi

# homes(h)ick dotfile management
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

# antigen zsh plugin management
source $HOME/.antigen/antigen.zsh
antigen use oh-my-zsh
#antigen bundle git
antigen bundle mosh
antigen bundle tmux
antigen bundle systemd
antigen bundle nmap
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme dpoggi
antigen apply

# aliases
alias su='sudo su -'
alias tmux='tmux -2'
alias th='ta `hostname -s` || ts `hostname -s`'
alias ls='ls -h --color'
alias ll='ls -lh --color'
alias la='ls -alh --color'
alias rm='rm -i' # use trash-cli instead

function greppkg(){
grep -R $1 /etc/portage/
}

export PATH="$PATH:$HOME/bin:$HOME/.cargo/bin"
