#!/bin/bash

# get the dir of the current script
script_dir="$( cd "$( dirname "$0" )" && pwd )"

# generate symlinks
if [[ ! -e ~/.profile ]]
then
  ln -s $script_dir/profile ~/.profile
fi

if [[ ! -e ~/.bashrc ]]
then
  ln -s $script_dir/bashrc ~/.bashrc
fi

if [[ ! -e ~/.bash_aliases ]]
then
  ln -s $script_dir/bash_aliases ~/.bash_aliases
fi

if [[ ! -e ~/.gitconfig ]]
then
  ln -s $script_dir/gitconfig ~/.gitconfig
fi

if [[ ! -e ~/.gitignore_global ]]
then
  ln -s $script_dir/gitignore_global ~/.gitignore_global
fi

if [[ ! -e ~/.vimrc ]]
then
  ln -s $script_dir/vimrc ~/.vimrc
fi

if [[ ! -e ~/.tmux.conf ]]
then
  ln -s $script_dir/tmux.conf ~/.tmux.conf
fi

if [[ ! -e ~/.ackrc ]]
then
  ln -s $script_dir/ackrc ~/.ackrc
fi

if [[ ! -e ~/.config/bpython/config ]]
then
  # -p says to create the dir if it doesn't exist already
  mkdir -p ~/.config/bpython
  ln -s $script_dir/bpython_config ~/.config/bpython/config
fi

if [[ ! -e ~/.config/redshift.conf ]]
then
  ln -s $script_dir/redshift.conf ~/.config/redshift.conf
fi

if [[ ! -e ~/.local/share/radiotray/bookmarks.xml ]]
then
  mkdir -p ~/.local/share/radiotray
  ln -s $script_dir/radiotray.xml ~/.local/share/radiotray/bookmarks.xml
fi
