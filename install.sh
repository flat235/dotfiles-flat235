#!/bin/bash
git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
$HOME/.homesick/repos/homeshick/bin/homeshick clone flat235/dotfiles-flat235
$HOME/.homesick/repos/homeshick/bin/homeshick link
