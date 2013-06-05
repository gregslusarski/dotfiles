#!/bin/bash

# remove symlinks
# -h means that file is a symlink
if [ -h ~/.profile ]; then
  rm ~/.profile
fi

# if [ -h ~/.bashrc ]; then
#   rm ~/.bashrc
# fi

# if [ -h ~/.config/terminator/config ]; then
#   rm ~/.config/terminator/config
# fi

if [ -h ~/.shell_aliases ]; then
  rm ~/.shell_aliases
fi

if [ -h ~/.gitconfig ]; then
  rm ~/.gitconfig
fi

if [ -h ~/.gitignore_global ]; then
  rm ~/.gitignore_global
fi

if [ -h ~/.vimrc ]; then
  rm ~/.vimrc
fi

if [ -h ~/.tmux.conf ]; then
  rm ~/.tmux.conf
fi

if [ -h ~/.ackrc ]; then
  rm ~/.ackrc
fi

# if [ -h ~/.config/bpython/config ]; then
#   rm ~/.config/bpython/config
# fi

if [ -h ~/.config/redshift.conf ]; then
  rm ~/.config/redshift.conf
fi

if [ -h ~/.local/share/radiotray/bookmarks.xml ]; then
  rm ~/.local/share/radiotray/bookmarks.xml
fi

if [ -h ~/scripts ]; then
  rm -r ~/scripts
fi

if [ -h ~/.zshrc ]; then
  rm ~/.zshrc
fi

if [ -h ~/.oh-my-zsh/themes/viszu.zsh-theme ]; then
  rm ~/.oh-my-zsh/themes/viszu.zsh-theme
fi

if [ -h ~/.pryrc ]; then
  rm ~/.pryrc
fi
