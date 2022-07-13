dir="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/dotfiles"
target="${HOME}"
packages=($(find "${dir}" -mindepth 1 -maxdepth 1 -type d -printf "%f\n" | grep "^[^\.]"))

stow --restow --dir="${dir}" --target="${target}" ${packages[@]}
