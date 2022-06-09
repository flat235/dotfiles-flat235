#!/bin/bash
mkdir --parents ~/.homesick/repos
git clone 'https://github.com/andsens/homeshick.git' ~/.homesick/repos/homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"
echo "y" | ~/.homesick/repos/homeshick/bin/homeshick clone flat235/dotfiles-flat235
echo 'to overwrite existing files use:'
echo 'homeshick link -f flat235/dotfiles-flat235'
