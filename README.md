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
`
$ stow i3
$ stow nvim
$ stow tmux
$ stow git
$ stow X
$ stow zsh
`