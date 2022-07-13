#!/usr/bin/env bash
install_apt_packages ()
{
  if [ -n "$apt_packages" ]; then
    sudo apt install ${apt_packages[*]} -y
    apt_packages=()
  fi
}
