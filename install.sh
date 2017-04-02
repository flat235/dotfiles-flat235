#!/bin/bash
mkdir -p ~/bin
mkdir -p ~/.homesick/repos
git clone 'https://github.com/andsens/homeshick.git' ~/.homesick/repos/homeshick
git clone 'https://github.com/zsh-users/antigen.git' .antigen
~/.homesick/repos/homeshick/bin/homeshick clone dotfiles-flat235
~/.homesick/repos/homeshick/bin/homeshick -f link dotfiles-flat235
