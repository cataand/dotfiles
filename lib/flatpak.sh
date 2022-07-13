#!/usr/bin/env bash
install_flatpak ()
{
  if ! command -v 'flatpak' &> /dev/null; then
    apt_packages=(flatpak)
    install_apt_packages
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  fi
}

install_flatpak_packages ()
{
  install_flatpak

  for package in "${flatpak_packages[@]}"; do
    flatpak install $package -y
  done
  declare -gA flatpak_packages
}
