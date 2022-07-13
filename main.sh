#!/usr/bin/env bash
SRC_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source $SRC_DIR/lib/apt.sh
source $SRC_DIR/lib/rust.sh
source $SRC_DIR/lib/node.sh
source $SRC_DIR/lib/source.sh

apt_packages=(
  # Desktop
  gnome-core
  gnome-tweaks
  gnome-shell-extension-appindicator
  ibus-anthy
  # Apps
  anki
  zathura
  # Utils
  flatpak
  gnome-software-plugin-flatpak
  git
  curl
  stow
  python3-pip
  texlive-full
)

declare -A rust_packages
#rust_packages[stylua]=0.14.0

declare -A node_packages
#node_packages[renovate]=20.5.1

source_packages=(
  tmux
  alacritty
  neovim
)

install_apt_packages
install_rust_packages
install_node_packages
install_source_packages
