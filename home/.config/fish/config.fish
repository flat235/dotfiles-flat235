source $HOME/.homesick/repos/homeshick/homeshick.fish

# PATH
set bindirs $HOME/bin $HOME/.cargo/bin $HOME/flutter/bin $HOME/android-studio/bin
for dir in $bindirs do
	if test -d $dir
		set PATH $dir $PATH
	end
end

set --export EDITOR vim
set --export TMUXSHELL (which fish)

if test -f $HOME/.localenv.fish
	source $HOME/.localenv.fish
end

# package manager
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

