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

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# homes(h)ick dotfile management
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

# Clone antidote if necessary.
if [[ ! -d ${ZDOTDIR:-~}/.antidote ]]; then
  git clone https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote
fi

# source antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

autoload -Uz promptinit && promptinit && prompt powerlevel10k

# aliases
alias sds='sudo su -'
alias si='sudo -i'
alias siu='sudo -i -u'
alias tmux='tmux -2'
alias ta='tmux attach -t'
alias ts='tmux new-session -s'
alias th='ta `hostname -s` || ts `hostname -s`'

if [[ $(uname) == 'Linux' ]]; then
	alias ls='ls -h --color'
elif [[ $(uname) == 'FreeBSD' ]]; then
	alias ls='ls -h -G'
	export IFCONFIG_FORMAT="inet:cidr,inet6:cidr"
elif [[ $(uname) == 'Darwin' ]]; then
	alias ls='ls -h -G'
else
	echo "I have no 'ls'-alias for $(uname), please add one to $HOME/.zshrc"
fi

alias ll='ls -lh --color'
alias la='ls -alh --color'
alias rm='rm -i' # use trash-cli instead

alias ping='ping -c 5'
alias path='print -l $path'
alias mkdir='mkdir -pv'

function grepir(){
	grep -R -i $2 $1
}

function greppkg(){
	if [[ -d /etc/portage ]]; then
		grep -R $1 /etc/portage/
	fi
	if [[ -d /usr/ports ]]; then
		find /usr/ports -type d -depth 2 -iname "*$1*"
	fi
}

function telnets(){
	openssl s_client -connect $1:$2
}

function tls-verify(){
	openssl s_client -connect $1:$2 2>/dev/null|grep "Verify return code:"
}

export PATH="$PATH:/usr/local/bin:$HOME/bin:$HOME/.cargo/bin"
export TMUXSHELL=$(which zsh)

# source kubectl completion if present
which kubectl > /dev/null && source <(kubectl completion zsh)

[ -f $HOME/.localenv ] && . $HOME/.localenv

# history settings
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

