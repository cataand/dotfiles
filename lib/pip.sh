#!/usr/bin/env bash
install_pip ()
{
  if ! command -v 'pip' &> /dev/null; then
    apt_packages=(python3-pip)
    install_apt_packages
  fi
}

install_pip_packages ()
{
  install_pip

  for package in "${!pip_packages[@]}"; do
    version=${pip_packages[$package]}
    pip install $package==$version
  done
  declare -gA pip_packages
}
