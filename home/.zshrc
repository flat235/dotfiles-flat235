# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
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

alias ls='ls -h --color=auto'
alias su='sudo su -'
alias tmux='tmux -2'
