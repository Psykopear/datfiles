# . files

Configuration for my arch environment.
It includes git, i3, neovim, tmux, X and zsh configs

# Usage

First clone the repository in your home directory (if cloning elsewhere, use stow with `--dir` parameter to set your home as the target directory)
`
$ git clone git@github.com:psykopear/datfiles .dotfiles
`

cd into the repo
`
$ cd .dotfiles
`

Then you can use stow to install configurations.
NOTE: this will *delete* existing files that match stow structure, replacing them with a symlink to the .dotfiles directory.
Look carefully at every file in the directory you are stowing to ensure you don't overwrite any actual configuration you might want to keep and make a backup first.
`
$ stow i3
$ stow nvim
$ stow tmux
$ stow git
$ stow X
$ stow zsh
`

## Packages

volnoti sxhkd i3-gaps-next-git i3blocks-gaps-git pamixer playerctl feh i3lock-fancy-dualmonitors-git rofi
