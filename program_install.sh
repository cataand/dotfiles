#!/usr/bin/env bash
SRC_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source $SRC_DIR/lib/apt.sh
source $SRC_DIR/lib/rust.sh
source $SRC_DIR/lib/node.sh
source $SRC_DIR/lib/pip.sh
source $SRC_DIR/lib/flatpak.sh
source $SRC_DIR/lib/source.sh

apt_packages=(
  # Desktop
  gnome-core
  gnome-tweaks
  papirus-icon-theme
  ibus-anthy
  # Apps
  tmux
  kitty
  anki
  zathura
  # Utils
  git
  curl
  stow
  texlive-full
)

declare -A rust_packages
#rust_packages[stylua]=0.14.0

declare -A node_packages
#node_packages[renovate]=20.5.1

declare -A pip_packages
#pip_packages[pynvim]=0.4.3

flatpak_packages=(
  tv.plex.PlexDesktop
  com.discordapp.Discord
)

source_packages=(
  neovim
)

install_apt_packages
install_rust_packages
install_node_packages
install_pip_packages
install_flatpak_packages
install_source_packages
