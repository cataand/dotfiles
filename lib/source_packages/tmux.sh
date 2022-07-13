#!/usr/bin/env bash
command='tmux'
url='https://github.com/tmux/tmux/releases/download/3.3a/tmux-3.3a.tar.gz'
checksum='e4fd347843bd0772c4f48d6dde625b0b109b7a380ff15db21e97c11a4dcdf93f'
srcDir='tmux-3.3a'
apt_packages=(
    libevent-dev
    libncurses5-dev
)

install () {
    ./configure && make
    sudo make install
}

uninstall () {
    sudo rm '/usr/local/bin/tmux'
    sudo rm '/usr/local/share/man/man1/tmux.1'
}

