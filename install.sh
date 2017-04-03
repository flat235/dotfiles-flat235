#!/bin/bash
mkdir -p ~/.homesick/repos
git clone 'https://github.com/andsens/homeshick.git' ~/.homesick/repos/homeshick
~/.homesick/repos/homeshick/bin/homeshick clone flat235/dotfiles-flat235
~/.homesick/repos/homeshick/bin/homeshick -f link dotfiles-flat235
