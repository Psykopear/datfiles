# echo "[3m$(fortune -sa)\n"

# Base16 Shell
# BASE16_SHELL="$HOME/.config/base16-shell/"
# [ -n "$PS1" ] && \
#     [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#         eval "$("$BASE16_SHELL/profile_helper.sh")"
#

# Set history file
export HISTFILE=/home/docler/.zsh_history
export HISTSIZE=100000
export SAVEHIST=50000

# History command configuration, copied from oh-my-zsh
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

function history {
  # unless a number is provided, show all history events (starting from 1)
  [[ ${@[-1]-} = *[0-9]* ]] && builtin fc -l "$@" || builtin fc -l "$@" 1
}

# Completion
fpath+=~/.zfunc

# Path to oh-my-zsh installation.
# export ZSH=/home/docler/.oh-my-zsh
export PATH=$PATH:~/.local/bin/:~/.yarn/bin/:~/.cargo/bin:/home/docler/.nvm/versions/node/v12.4.0/bin:~/.local/opt/google-cloud-sdk/bin
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Neovim remote command
export NVR_CMD=nvim-qt

export BAT_THEME="TwoDark"

export EDITOR='nvim'
export TERMINAL='alacritty'
export BROWSER='firefox'

eval "$(starship init zsh)"
# Lines configured by zsh-newuser-install
bindkey -e
# End of lines configured by zsh-newuser-install
unsetopt flowcontrol
setopt menu_complete   # do not autoselect the first completion entry
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion::complete:*' use-cache 1
export ZSH_CACHE_DIR=/home/docler/.cache/
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR
expand-or-complete-with-dots() {
    # toggle line-wrapping off and back on again
    [[ -n "$terminfo[rmam]" && -n "$terminfo[smam]" ]] && echoti rmam
    print -Pn "%{%F{red}......%f%}"
    [[ -n "$terminfo[rmam]" && -n "$terminfo[smam]" ]] && echoti smam

    zle expand-or-complete
    zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

autoload -Uz compinit
compinit

# Kubectl completion
if (( $+commands[kubectl] )); then
    __KUBECTL_COMPLETION_FILE="${ZSH_CACHE_DIR}/kubectl_completion"

    if [[ ! -f $__KUBECTL_COMPLETION_FILE ]]; then
        kubectl completion zsh >! $__KUBECTL_COMPLETION_FILE
    fi

    [[ -f $__KUBECTL_COMPLETION_FILE ]] && source $__KUBECTL_COMPLETION_FILE

    unset __KUBECTL_COMPLETION_FILE
fi


[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f ~/.fzf.colors ] && source ~/.fzf.colors
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



# Virtualenvwrapper, lazily loaded
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper_lazy.sh

# Fish like completion
source ~/repos/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept

# Compilation flags
export ARCHFLAGS="-arch x86_64 -j13"

# Function used to load tmuxp projects
load() {
    tmuxp load ~/.config/tmux-sessions/$1.yml
}
# This function returns completion items for `load`
loadcompletion() {
    reply=( $(ls -1 ~/.config/tmux-sessions/ | cut -d. -f1) )
}
compctl -K loadcompletion load

# Aliases
alias h='howdoi -c -a'
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
alias b="backblaze-b2"
# Image cat, only works on kitty
alias icat="kitty +kitten icat"

# web services
alias weather='curl -s wttr.in/perugia | head -7'
alias weatherforecast='curl -s wttr.in/perugia | head -37 | tail -30'

# trying exa
alias ls='exa'

# Mouse while typing
alias setmouse='xinput --set-prop "SYNA2393:00 06CB:7A13 Touchpad" "libinput Disable While Typing Enabled" 0'
alias unsetmouse='xinput --set-prop "SYNA2393:00 06CB:7A13 Touchpad" "libinput Disable While Typing Enabled" 1'

alias snvim='NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim'
alias snvimqt='NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim-qt'
# alias snvim='NVIM_LISTEN_ADDRESS=/tmp/nvimsocket alacritty -e nvim &!'
# alias snvim='NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim-qt'

# DIOPORCO
# alias ionic='/home/docler/.nvm/versions/node/v12.4.0/lib/node_modules/ionic/bin/ionic'
# alias cordova='/home/docler/.nvm/versions/node/v12.4.0/lib/node_modules/cordova/bin/cordova'


# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
function fkill() {
    local pid
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}

function tj() {
    jump $1
    tmux
}
source /home/docler/.oh-my-zsh/plugins/jump/jump.plugin.zsh
compctl -K _completemarks tj

# extract archives
function extract()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.xz)    tar -xf $1      ;;
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
# source /usr/share/nvm/init-nvm.sh

# Lazy load pythonz
pythonz() {
    [ -z "$PYTHONZED" ] && {
        PYTHONZED=1
            unset -f pythonz
            source ~/.pythonz/etc/bashrc
        }
    pythonz $@
}

# Lazy load thefuck aliases
fuck() {
    [ -z "$FUCKED" ] && {
        FUCKED=1
            unset -f fuck;
            eval $(thefuck --alias)
        }
    fuck
}

# Android paths
export ANDROID_HOME=/opt/android-sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools


# Poetry path
export PATH=${PATH}:$HOME/.poetry/bin

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

# Python scratchpad using nvim and Codi
codi() {
    local syntax="${1:-python}"
    shift
    nvim -c \
        "let g:startify_disable_at_vimenter = 1 |\
        set bt=nofile ls=0 noru nonu nornu |\
        hi ColorColumn ctermbg=NONE |\
        hi VertSplit ctermbg=NONE |\
        hi NonText ctermfg=0 |\
        Codi $syntax" "$@"
    }


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/docler/tmp/[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D/google-cloud-sdk/path.zsh.inc' ]; then source '/home/docler/tmp/[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/docler/tmp/[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/docler/tmp/[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D/google-cloud-sdk/completion.zsh.inc'; fi


# Git fuzzy
export PATH="/home/docler/repos/git-fuzzy/bin:$PATH"
