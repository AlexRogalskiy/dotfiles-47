source "/usr/local/antigen/antigen.zsh"

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle Tarrasch/zsh-bd
antigen bundle docker
antigen apply

# zsh-history-substring-search
# Bind up, down, C-p and C-n to zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down


# Enable oh-my-git with oppa-lana-style theme
setopt prompt_subst
source ~/prg/bash/oh-my-git-themes/spectrum.zsh
source ~/prg/bash/oh-my-git/base.sh
source ~/prg/bash/oh-my-git-themes/oppa-lana-style.zsh-theme


autoload -U colors && colors
VIRTUAL_ENV_DISABLE_PROMPT=true
function omg_prompt_callback() {
    if [ -n "${VIRTUAL_ENV}" ]; then
        echo "%F{white}(`basename ${VIRTUAL_ENV}`)%f "
    fi
}
#omg_second_line='%~ •'
omg_ungit_prompt="%~ • "


export EDITOR=emacs
export GIT_EDITOR=emacs

export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'

# pip cache
export PIP_DOWNLOAD_CACHE="$HOME/.pipcache"
mkdir -p ${PIP_DOWNLOAD_CACHE}
export LANG=en_US.UTF-8

# java
JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/Current/
export JAVA_HOME

## Aliases
alias ..="cd ..;ll"
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias upto=bd
# apps
alias g="git"
alias e="emacsclient -n "
alias ee="emacs"
alias estart="/Applications/Emacs.app/Contents/MacOS/Emacs --daemon"
alias estop="e -e '(kill-emacs)'"

alias p="python"


# python
alias act="source bin/activate"

# git
alias gg="git checkout"
alias feat="git checkout -b"
alias stage="git add"
alias undo="git checkout -- ."
alias h="git log --oneline"
alias d='git diff'

alias -g L="|less"


alias f="fg"
alias j="jobs"

alias do=docker

#eval "$(thefuck --alias)"

function l() {
    ls -la;
}

# cd into a directory, then list it
function c() {
    cd $1
    l
}

# Creates a directory, then cd into it
m() {
    mkdir -p $1
    cd $1
}

alias tree="nocorrect tree"

w() {
    clear &&  git branch && echo && git status --short --untracked-files=all --branch
}

dn() {
    git status --short --branch | grep '^.[M\?]' | head -1 | awk '{print $2}' | xargs git diff && w
    #git diff --name-only | head -1 | xargs git diff -- && w
}

an() {
    git status --short --branch | grep '^.[M\?]' | head -1 | awk '{print $2}' | xargs git add && w
    #git diff --name-only | head -1 | xargs git add && w
}

ramd() {
    local size_in_mb=$1
    local size=$(expr ${size_in_mb} \* 1024)
    local name="RamDisk"
    diskutil erasevolume HFS+ "$name" `hdiutil attach -nomount ram://$size`
    echo The ${size_in_mb} Mb ram disk $name is ready
}

dockerkillall() {
    docker stop $(docker ps -a -q)
    docker rm $(docker ps -a -q)
}

dockerremovestopped() {
    docker rm $(docker ps -qa --filter="status=exited")
}

denv() {
    eval "$(docker-machine env ${1:=default})"
}

denvs() {
    eval "$(docker-machine env --swarm $1)"
}


export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export GOPATH=/Users/arialdomartini/prg/go
export PATH=$PATH:$GOPATH/bin
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export HISTFILE=/Users/arialdomartini/.zsh_history
export SAVEHIST=9999999
export HISTSIZE=9999999
