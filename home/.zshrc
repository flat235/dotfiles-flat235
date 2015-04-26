# homes(h)ick dotfile management
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

# antigen zsh plugin management
source .antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle mosh
antigen bundle tmux
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme dpoggi
antigen apply

# aliases
alias su='sudo su -'
alias tmux='tmux -2'
alias ls='ls -h --color'
alias ll='ls -lh --color'
alias la='ls -alh --color'
