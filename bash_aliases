# Terminal
alias ..='cd ..'
alias qq='exit'
alias c='clear'
alias r='reset'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Apt stuff
alias sagi='sudo apt-get install'
alias sagr='sudo apt-get remove'
alias saga='sudo apt-get autoremove'
alias sagu='sudo apt-get update'
alias sup='sudo apt-get update && sudo apt-get upgrade && sudo apt-get clean'
alias saar='sudo add-apt-repository'

# Git
alias gcl='git clone'
alias gi='git init'
alias ga='git add'
alias ga.='git add .'
alias gc='git commit'
alias gci='git commit -m'
alias gcia='git commit -am'
alias gciam='git commit --ammend -m'
alias gst='git status'
alias gsts='git status -s'
alias gstis='git status --ignore-submodules'
alias glg='git log'
alias glgo='git log --oneline'
alias gdf='git diff'
alias gdfc='git diff --cached'
alias gdfis='git diff --ignore-submodules'
alias gsma='git submodule add'
alias gsmi='git submodule init'
alias gsmu='git submodule update'
alias gsmui='git submodule update --init'
alias grtaog='git remote add origin'
alias gpsuogmt='git push -u origin master'
alias gplsub='git submodule foreach "git pull origin master"'
alias grmc='git rm --cached'

# Vim
alias v='vim'
alias vg='gvim'
alias vdf='vimdiff'

# Tmux
alias tmux='TERM=screen-256color-bce tmux'
alias t='TERM=screen-256color-bce tmux'

# Ack-grep
alias ack='ack-grep'
alias a='ack-grep'
