# Stow dotfiles
dir="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
target="${HOME}"
packages=($(find "${dir}" -mindepth 1 -maxdepth 1 -type d -printf "%f\n" | grep "^[^\.]"))
stow --restow --dir="${dir}" --target="${target}" ${packages[@]}

# Install packages
dnf_packages=(
  fish
  alacritty
  neovim
  gcc-c++
  python3-pip
  cargo
  npm
  ripgrep
)
sudo dnf install ${dnf_packages[*]} -y

pip_packages=(
  pynvim==0.4.3
  black==22.6.0
)
pip install ${pip_packages[*]}

cargo_packages=(
  stylua@0.14.0
)
cargo install ${cargo_packages[*]}
