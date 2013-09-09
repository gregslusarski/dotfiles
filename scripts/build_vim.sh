hg clone https://code.google.com/p/vim/ /tmp/vim_source && \
cd /tmp/vim_source && \
./configure --with-features=huge \
--prefix=/usr/local \
--disable-nls \
--enable-gui=gnome2 \
--enable-multibyte \
--enable-pythoninterp \
--with-python-config-dir=/usr/lib/python2.7/config \
--enable-rubyinterp \
--with-ruby-command=`rbenv which ruby` && \
make VIMRUNTIMEDIR=/usr/local/share/vim/vim74 && \
sudo make install && \
sudo rm -r /tmp/vim_source
