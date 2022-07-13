#!/usr/bin/env bash
install_node ()
{
  if ! command -v 'npm' &> /dev/null; then
    curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
    sudo apt-get install -y npm
  fi
}

install_node_packages ()
{
  install_node
  
  for package in "${!node_packages[@]}"; do
    version=${node_packages[$package]}
    npm list --location=global $package || sudo npm install --location=global $package@$version
  done
  declare -gA node_packages
}