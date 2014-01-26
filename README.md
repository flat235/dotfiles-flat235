dotfiles
========

my personal configuration dot-files

feel free to steal whatever you like

homesick / homeshick
--------------------

```sh
git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
echo 'source "$HOME/.homesick/repos/homeshick/homeshick.sh"' >> ~/.zshrc
echo 'fpath=($HOME/.homesick/repos/homeshick/completions $fpath)' >> ~/.zshrc
homeshick clone flat235/dotfiles-flat235
```

