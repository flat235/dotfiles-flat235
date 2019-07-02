#!/bin/bash
mkdir --parents ~/.homesick/repos
git clone 'https://github.com/andsens/homeshick.git' ~/.homesick/repos/homeshick
~/.homesick/repos/homeshick/bin/homeshick clone flat235/dotfiles-flat235
~/.homesick/repos/homeshick/bin/homeshick --force --batch link dotfiles-flat235
curl -sLf https://spacevim.org/install.sh | bash
