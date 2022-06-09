#!/bin/bash
mkdir --parents ~/.homesick/repos
git clone 'https://github.com/andsens/homeshick.git' ~/.homesick/repos/homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
echo "y" | ~/.homesick/repos/homeshick/bin/homeshick clone flat235/dotfiles-flat235
