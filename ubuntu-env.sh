#!/usr/bin/env bash

sudo apt-get install git git-doc git-man
sudo apt-get install libncurses5-dev


wget http://jaist.dl.sourceforge.net/project/levent/libevent/libevent-2.0/libevent-2.0.22-stable.tar.gz
tar xzvf libevent-2.0.22-stable.tar.gz
cd libevent-2.0.22-stable

./configure && make
sudo make install


git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
sudo ./configure && make && make install
