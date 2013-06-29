#!/bin/bash

# Get the dir of the current script
script_dir="$( cd "$( dirname "$0" )" && pwd )"

# Keep a log of all created links (used by revert.sh)
loglink() {
  if ! grep -q -s "$1" $script_dir/.log; then
    echo "$1" >> $script_dir/.log
  fi
}

# Count created links
counter=0

dolink() {
  ln -s "$origin" "$dest"
  loglink "$dest"
  counter=$(($counter + 1))
}

checklink() {
  # Force link creation
  if [ $force = 1 ]; then
    # If exists and is not a symlink
    if [ -e $dest ] && [ ! -h $dest ]; then
      if [ ! -e $dest.backup ]; then
        # Backup original file
        mv $dest $dest.backup
      else
        echo "Error! $dest.backup already exists."
      fi
    fi
    if [ ! -e $dest ]; then
      dolink
    fi
  else
    if [ ! -e $dest ]; then
      dolink
    fi
  fi
}

symlinkhome() {
  for f in $script_dir/home/*; do
    origin=$f
    dest="$HOME/.`basename $f`"
    checklink
  done
}

symlink() {
  if [ $1 ] && [ $2 ]; then
    origin="$script_dir/others/$1"
    dest=$2
    checklink
  fi
}

force=0

# Check if script was called with `-f` flag
if [ $1 ]; then
  if [ $1 = "-f" ]; then
    force=1
  fi
fi

###############################################################################

symlinkhome

symlink "redshift.conf" "$HOME/.config/redshift.conf"

mkdir -p ~/.local/share/radiotray
symlink "radiotray.xml" "$HOME/.local/share/radiotray/bookmarks.xml"

mkdir -p ~/.oh-my-zsh/themes
symlink "viszu.zsh-theme" "$HOME/.oh-my-zsh/themes/viszu.zsh-theme"

###############################################################################

if [ ! -d ~/.vim ] && [ -e ~/.vimrc ]; then
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
  vim +BundleInstall! +BundleClean +qall
fi

if [ $counter = 1 ]; then
  echo "Done! $counter symlink created."
else
  echo "Done! $counter symlinks created."
fi
