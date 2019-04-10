# echo "[3m$(fortune -sa)\n"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# Path to oh-my-zsh installation.
export ZSH=/home/docler/.oh-my-zsh
export PATH=$PATH:~/.local/bin/:~/.yarn/bin/
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="af-magic"
ZSH_THEME="flazz"
# ZSH_THEME="kennethreitz"
# ZSH_THEME="norm"
plugins=(git jump kubectl)

export BAT_THEME="TwoDark"

export EDITOR='nvim'
export TERMINAL='urxvt'
export BROWSER='firefox'

source $ZSH/oh-my-zsh.sh

# Virtualenvwrapper, lazily loaded
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper_lazy.sh

# Compilation flags
export ARCHFLAGS="-arch x86_64 -j13"

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
alias localip='ip -o -4 addr | cut -d " " -f 7 | rg "192.168" | cut -d "/" -f 1'
alias externalip='dig +short myip.opendns.com @resolver1.opendns.com'
# Aliases for systemctl
alias start='sudo systemctl start'
alias stop='sudo systemctl stop'
alias restart='sudo systemctl restart'
alias ustatus='systemctl --user status'
alias ustart='systemctl --user start'
alias ustop='systemctl --user stop'
alias urestart='systemctl --user restart'
alias git-server='git daemon --reuseaddr --base-path=. --export-all --verbose'
# Literal search rg
alias rgl="rg -F"

# web services
alias weather='curl -s wttr.in/perugia | head -7'
alias weatherforecast='curl -s wttr.in/perugia | head -37 | tail -30'

# alias yarn
alias yltub='yarn lint && yarn test -u && yarn build'

# trying exa
alias ls='exa'

# Mouse while typing
alias setmouse='xinput --set-prop "SYNA2393:00 06CB:7A13 Touchpad" "libinput Disable While Typing Enabled" 0'
alias unsetmouse='xinput --set-prop "SYNA2393:00 06CB:7A13 Touchpad" "libinput Disable While Typing Enabled" 1'

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

change-version() {
  if [ -z $1 ]; then; echo "Usage:\n    change-version PREVIOUS_VERSION NEXT_VERSION"; return; fi;
  if [ -z $2 ]; then; echo "Usage:\n    change-version PREVIOUS_VERSION NEXT_VERSION"; return; fi;
  rg -l $1 | xargs sed -i s/$1/$2/
}

# Load nvm
source /usr/share/nvm/init-nvm.sh

# Lazy load thefuck aliases
fuck() {
  [ -z "$FUCKED" ] && {
    FUCKED=1
    unset -f fuck;
    eval $(thefuck --alias)
  }
  fuck
}

[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'
export FZF_DEFAULT_COMMAND='fd --type f --follow --exclude .git'
# export FZF_DEFAULT_COMMAND='fd --type f'
# If current selection is a text file shows its content,
# if it's a directory shows its content, the rest is ignored
FZF_CTRL_T_OPTS="--preview-window wrap --preview '
if [[ -f {} ]]; then
    file --mime {} | grep -q \"text\/.*;\" && bat --color \"always\" {} || (tput setaf 1; file --mime {})
elif [[ -d {} ]]; then
    exa -l --color always {}
else;
    tput setaf 1; echo YOU ARE NOT SUPPOSED TO SEE THIS!
fi'"
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

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
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Tmux stuff
export DISABLE_AUTO_TITLE='true'

# Lastpass passwd timeout
export LPASS_AGENT_TIMEOUT=28800

# Full load test
_fulload() {
    dd if=/dev/zero of=/dev/null \
  | dd if=/dev/zero of=/dev/null \
  | dd if=/dev/zero of=/dev/null \
  | dd if=/dev/zero of=/dev/null \
  | dd if=/dev/zero of=/dev/null \
  | dd if=/dev/zero of=/dev/null &
}

alias fulload='_fulload; read; killall dd'


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/docler/tmp/[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D/google-cloud-sdk/path.zsh.inc' ]; then source '/home/docler/tmp/[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/docler/tmp/[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/docler/tmp/[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D/google-cloud-sdk/completion.zsh.inc'; fi

source /home/docler/.config/broot/launcher/bash/br
