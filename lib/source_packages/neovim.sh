#!/usr/bin/env bash
command='nvim'
url='https://github.com/neovim/neovim/archive/refs/tags/v0.7.2.tar.gz'
checksum='ccab8ca02a0c292de9ea14b39f84f90b635a69282de38a6b4ccc8565bc65d096'
srcDir='neovim-0.7.2'
apt_packages=(
    ninja-build
    gettext
    libtool
    libtool-bin
    autoconf
    automake
    cmake
    g++
    pkg-config
    unzip
    curl
    doxygen
)
rust_packages[stylua]=0.14.0

install () {
    pip install pynvim
    make CMAKE_BUILD_TYPE=Release
    sudo make install
}

uninstall () {
    sudo rm /usr/local/bin/nvim
    sudo rm -r /usr/local/share/nvim/
}

