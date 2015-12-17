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
antigen bundle meteor
antigen bundle systemd
antigen bundle nmap
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme dpoggi
antigen apply

# aliases
alias su='sudo su -'
alias tmux='tmux -2'
alias th='ta `hostname` || ts `hostname`'
alias ls='ls -h --color'
alias ll='ls -lh --color'
alias la='ls -alh --color'
alias rm='rm -I'
alias trash='kfmclient move "$@" trash:/'

function greppkg(){
grep -R $1 /etc/portage/
}

function newmet(){
meteor create $1
cd $1
meteor add twbs:bootstrap
meteor add accounts-password
meteor add coffeescript
meteor add ian:accounts-ui-bootstrap-3
meteor add mquandalle:jade
rm $1.*
echo "title $1" > head.tpl.jade
echo "div(class=\"container\")" > body.tpl.jade
echo "\th1 $1" >> body.tpl.jade
}

export PATH="$PATH:$HOME/bin:$HOME/.cargo/bin"
