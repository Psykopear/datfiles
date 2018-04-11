# . files
Configuration for my arch environment.
It includes git, i3, neovim, tmux, X and zsh configs

# Usage
First clone the repository in your home directory.
If cloning elsewhere, call stow with the `--dir $HOME` parameter to set your home as the target directory)
`
$ git clone git@github.com:psykopear/datfiles .dotfiles
`

cd into the repo
`
$ cd .dotfiles
`

Then you can use stow to install configurations.
NOTE: this will *delete* existing files that match stow structure, replacing them with a symlink to the .dotfiles directory.
Look carefully at every file in the directory you are stowing to ensure you don't overwrite any actual configuration you might want to keep, and make a backup first.
`
$ stow i3
$ stow nvim
$ stow tmux
$ stow git
$ stow X
$ stow zsh
`

## Packages

This is a (not comprehensive right now) list of packages needed for this configuration to work.
I use a lot of weird forks on AUR, that's not the recommended thing, you should probably stick to
packages maintained by the arch developers when possible.

## Repos
sxhkd pamixer playerctl feh rofi compton stow rxvt-unicode xorg xorg-xinit base-devel git
## AUR
libinput-gestures volnoti i3-gaps-next-git i3blocks-gaps-git i3lock-fancy-dualmonitors-git
