# Path to oh-my-zsh installation.
export ZSH=/home/docler/.oh-my-zsh
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
plugins=(git jump)
source $ZSH/oh-my-zsh.sh

# Environment
export LANG=en_US.UTF-8
export EDITOR='nvim'
export TERMINAL='urxvt'

# Virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

# Compilation flags
export ARCHFLAGS="-arch x86_64 -j5"

# Aliases
alias delete-pyc='find -name "*.pyc" -delete'
alias s='yaourt -Ss'
alias i='yaourt -S'
alias u='yaourt -Syu --aur'
alias r='yaourt -R'
alias j='jump'
alias m='mark'
alias ms='marks'
alias porcoddio='sudo $(fc -ln -1)'
alias cd..='cd ..'
alias jsonbello='python -m json.tool'

# Aliases for systemctl
alias start='sudo systemctl start'
alias stop='sudo systemctl stop'
alias restart='sudo systemctl restart'

# lastpass cli aliases
alias lspass='lpass ls --color=always | less -r'
alias cppass='lpass show --password -c'
alias cpuser='lpass show --username -c'

eval $(thefuck --alias)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
