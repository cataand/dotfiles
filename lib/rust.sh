#!/usr/bin/env bash
install_rust ()
{
  if ! command -v 'cargo' &> /dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source $HOME/.cargo/env
  fi
}

install_rust_packages ()
{
  install_rust

  for package in "${!rust_packages[@]}"; do
    version=${rust_packages[$package]}
    cargo install --version $version $package
  done
  declare -gA rust_packages
}