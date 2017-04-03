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
if [[ -d $HOME/.antigen ]]; then
	echo "antigen already installed, proceeding"
else
	git clone 'https://github.com/zsh-users/antigen.git' $HOME/.antigen
fi
source $HOME/.antigen/antigen.zsh
antigen use oh-my-zsh
#antigen bundle git
antigen bundle mosh
antigen bundle tmux
antigen bundle systemd
antigen bundle nmap
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
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
