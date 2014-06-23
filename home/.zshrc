# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# home
bindkey "^[[1~" beginning-of-line
# end
bindkey "^[[4~" end-of-line
# c-rightarrow
bindkey "^[OC" forward-word
# c-leftarrow
bindkey "^[OD" backward-word

zstyle :compinstall filename '/home/flatline/.zshrc'

autoload -Uz compinit promptinit
compinit
autoload -U colors && colors

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

source ~/.zsh/git-prompt/zshrc.sh

promptinit
#prompt adam2

PROMPT='%B________________
%B|-- returned: %?
%B|-- (%{$fg[green]%}%~%{$reset_color%}%B)%b $(git_super_status)
%B|-- %(!.%{$fg[red]%}.%{$fg[cyan]%})%n%{$fg[cyan]%}@%m%{$reset_color%}
%B\-- %b%(!.%{$fg[red]%}#%{$reset_color%}.%{$fg[green]%}$%{$reset_color%}) '

# End of lines added by compinstall
PATH="$PATH:$HOME/bin"
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

alias ls='ls -h --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -lah --color=auto'
alias su='sudo su -'
alias tmux='tmux -2'
