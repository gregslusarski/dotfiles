## Installation

    cd ~
    git clone https://github.com/viszu/dotfiles.git

Vim plugins are installed as a git submodules, so:

    cd dotfiles
    git submodule init
    git submodule update

## Generate symlinks

    ln -s ~/dotfiles/vim ~/.vim
    ln -s ~/dotfiles/vimrc ~/.vimrc
    ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
    ln -s ~/dotfiles/bashrc ~/.bashrc
    ln -s ~/dotfiles/gitconfig ~/.gitconfig
    ln -s ~/dotfiles/config/redshift.conf ~/.config/redshift.conf
    ln -s ~/dotfiles/config/Terminal/terminalrc ~/.config/Terminal/terminalrc

## Remove symlinks (careful here!)

    rm -r ~/.vim
    rm ~/.vimrc
    rm ~/.tmux.conf
    rm ~/.bashrc
    rm ~/.gitconfig
    rm ~/.config/redshift.conf
    rm ~/.config/Terminal/terminalrc

## Update Vim plugins

    cd dotfiles
    git submodule foreach 'git pull origin master'

## Install new plugins

Example:

    cd dotfiles
    git submodule add https://github.com/nick/what.git vim/bundle/what

    git add .
    git commit -m 'Install what.vim plugin'
