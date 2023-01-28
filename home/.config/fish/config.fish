source "$HOME/.homesick/repos/homeshick/homeshick.fish"
source "$HOME/.homesick/repos/homeshick/completions/homeshick.fish"

# PATH
set bindirs $HOME/bin $HOME/.local/bin $HOME/.cargo/bin $HOME/android-studio/bin $HOME/.nimble/bin
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
    curl "https://git.io/fisher" --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# set vi mode
fish_vi_key_bindings
