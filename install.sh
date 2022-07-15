#!/bin/bash
# Add and pin testing and unstable repos
sudo tee /etc/apt/sources.list.d/custom.list > /dev/null <<EOT
deb http://deb.debian.org/debian/ testing main contrib non-free
deb-src http://deb.debian.org/debian/ testing main contrib non-free

deb http://deb.debian.org/debian/ unstable main contrib non-free
deb-src http://deb.debian.org/debian/ unstable main contrib non-free
EOT

sudo tee /etc/apt/preferences.d/custom.pref > /dev/null <<EOT
Package: *
Pin: release a=stable
Pin-Priority: 900

Package: *
Pin: release a=testing
Pin-Priority: 400

Package: *
Pin: release a=unstable
Pin-Priority: 50
EOT

sudo apt install gnome-core stow -y

SRC_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
CONFIG_DIR=$SRC_DIR/configs
TARGET=$HOME
packages=($(find "${CONFIG_DIR}" -mindepth 1 -maxdepth 1 -type d -printf "%f\n" | grep "^[^\.]"))
stow --restow --dir="${CONFIG_DIR}" --target="${TARGET}" ${packages[@]}
