source "$HOME/.antigen/antigen.zsh"

PATH="/usr/local/bin:$PATH"

antigen-use oh-my-zsh
antigen-bundle git
antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-bundle zsh-users/zsh-history-substring-search
antigen-bundle arialdomartini/oh-my-git
antigen theme arialdomartini/oh-my-git-themes arialdo-granzestyle

antigen-apply

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

export EDITOR=emacs

# pip cache
export PIP_DOWNLOAD_CACHE="$HOME/.pipcache"
mkdir -p ${PIP_DOWNLOAD_CACHE}
export LANG=en_US.UTF-8


## Aliases
alias ..="cd ..;ll"
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# apps
alias g="git"
alias e="emacs"
alias p="python"


# python
alias act="source bin/activate"

# git
alias go="git checkout"
alias feat="git checkout -b"
alias stage="git add"
alias undo="git checkout -- ."
alias h="git log --oneline"
alias d='git diff'

alias -g L="|less"


alias f="fg"
alias j="jobs"

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
    clear &&  ls -l && echo && git branch && echo && git status --short --branch
}

dn() {
    git status --short --branch | grep '^.[M\?]' | head -1 | awk '{print $2}' | xargs git diff && w
    #git diff --name-only | head -1 | xargs git diff -- && w
}

an() {
    git status --short --branch | grep '^.[M\?]' | head -1 | awk '{print $2}' | xargs git add && w
    #git diff --name-only | head -1 | xargs git add && w
}



PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
