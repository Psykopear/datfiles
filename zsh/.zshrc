echo "[3m$(fortune -sa)\n"

fpath+=~/.zfunc

# Path to oh-my-zsh installation.
export ZSH=/home/docler/.oh-my-zsh
export PATH=$PATH:~/.local/bin/

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="half-life"
# ZSH_THEME="pygmalion"
plugins=(git jump)

export EDITOR='nvim'
export TERMINAL='urxvt'
export BROWSER='firefox'

source $ZSH/oh-my-zsh.sh

# Virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

# Compilation flags
export ARCHFLAGS="-arch x86_64 -j5"

# Aliases
alias delete-pyc='find -name "*.pyc" -delete'
alias s='pikaur -Ss'
alias i='pikaur -S'
alias u='pikaur -Syu'
alias udevel='pikaur -Syu --devel --needed --keepbuild'
alias r='pikaur -R'
alias j='jump'
alias m='mark'
alias ms='marks'
alias porcoddio='sudo $(fc -ln -1)'
alias cd..='cd ..'
alias jsonbello='python -m json.tool'
alias qgit='git'

# Aliases for systemctl
alias start='sudo systemctl start'
alias stop='sudo systemctl stop'
alias restart='sudo systemctl restart'

# lastpass cli aliases
alias lspass='lpass ls --color=always | less -r'
alias cppass='lpass show --password -c'
alias cpuser='lpass show --username -c'

# web services
alias weather='curl -s wttr.in/perugia | head -7'
alias weatherforecast='curl -s wttr.in/perugia | head -37 | tail -30'

# alias yarn
alias yltub='yarn lint && yarn test -u && yarn build'

# trying exa
alias ls='exa'

# extract archives
function extract()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

eval $(thefuck --alias)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Android paths
export ANDROID_HOME=/opt/android-sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

timer() {
    clear
    date1=`date +%s`
    while true
    do
       echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r"
       sleep 1
    done
}

# Colored man
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# Colored code in less
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS='-R '

# ZSH syntax highlight
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Tmux stuff
export DISABLE_AUTO_TITLE='true'

# Lastpass passwd timeout
export LPASS_AGENT_TIMEOUT=28800

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/docler/tmp/[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D/google-cloud-sdk/path.zsh.inc' ]; then source '/home/docler/tmp/[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/docler/tmp/[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/docler/tmp/[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D/google-cloud-sdk/completion.zsh.inc'; fi
