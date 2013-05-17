#!/bin/bash

# get the dir of the current script
script_dir="$( cd "$( dirname "$0" )" && pwd )"

mkdir -p ~/bin

# generate symlinks
if [ ! -e ~/.profile ]; then
  ln -s $script_dir/shell/profile ~/.profile
fi

# if [ ! -e ~/.bashrc ]; then
#   ln -s $script_dir/shell/bashrc ~/.bashrc
# fi

# if [ ! -e ~/.config/terminator/config ]; then
#   ln -s $script_dir/shell/terminator_config ~/.config/terminator/config
# fi

if [ ! -e ~/.shell_aliases ]; then
  ln -s $script_dir/shell/shell_aliases ~/.shell_aliases
fi

if [ ! -e ~/.gitconfig ]; then
  ln -s $script_dir/shell/gitconfig ~/.gitconfig
fi

if [ ! -e ~/.gitignore_global ]; then
  ln -s $script_dir/shell/gitignore_global ~/.gitignore_global
fi

if [ ! -e ~/.tmux.conf ]; then
  ln -s $script_dir/shell/tmux.conf ~/.tmux.conf
fi

if [ ! -e ~/.ackrc ]; then
  ln -s $script_dir/shell/ackrc ~/.ackrc
fi

if [ ! -e ~/.config/bpython/config ]; then
  # -p says to create the dir if it doesn't exist already
  mkdir -p ~/.config/bpython
  ln -s $script_dir/shell/bpython_config ~/.config/bpython/config
fi

if [ ! -e ~/.config/redshift.conf ]; then
  ln -s $script_dir/stuff/redshift.conf ~/.config/redshift.conf
fi

if [ ! -e ~/.local/share/radiotray/bookmarks.xml ]; then
  mkdir -p ~/.local/share/radiotray
  ln -s $script_dir/stuff/radiotray.xml ~/.local/share/radiotray/bookmarks.xml
fi

if [ ! -d ~/scripts ]; then
  ln -s $script_dir/scripts ~/scripts
fi

# zsh
if [ ! -e ~/.zshrc ]; then
  ln -s $script_dir/shell/zshrc ~/.zshrc
fi

if [ ! -e ~/.oh-my-zsh/themes/viszu.zsh-theme ]; then
  mkdir -p ~/.oh-my-zsh/themes
  ln -s $script_dir/shell/viszu.zsh-theme ~/.oh-my-zsh/themes/viszu.zsh-theme
fi

# vim
mkdir -p ~/vim_test/after

if [ ! -e ~/.vimrc ]; then
  ln -s $script_dir/vim/vimrc ~/.vimrc
fi

if [ ! -d ~/.vim ]; then
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
  vim +BundleInstall! +BundleClean +qall
fi
