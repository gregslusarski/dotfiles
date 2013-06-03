#!/bin/bash

# Build / Update vim with: GUI, python and ruby support
# Dependencies (Install manually):
# sudo apt-get build-dep vim-gnome
# sudo apt-get install gnome-devel

hg clone https://vim.googlecode.com/hg/ /tmp/vim_source && cd /tmp/vim_source && ./configure --disable-nls --enable-multibyte --with-tlib=ncurses --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config --enable-rubyinterp --with-ruby-command=/home/viszu/.rbenv/versions/2.0.0-p195/bin/ruby --with-features=huge --enable-gui=gnome2 && make && sudo make install && rm -r /tmp/vim_source
