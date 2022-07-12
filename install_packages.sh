#!/usr/bin/env bash
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root"
    exit
fi

packagesFromManager=(
    # Desktop
    gnome-core
    gnome-tweaks
    ibus-anthy

    # Apps

    # Utils
    flatpak
    gnome-software-plugin-flatpak
    git
    curl
)
apt -yq install ${packagesFromManager[*]}

packagesFromSource=(
    tmux
    alacritty
    neovim
)

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
WORK_DIR="/tmp/$(cat /proc/sys/kernel/random/uuid)"

source $SCRIPT_DIR/functions.sh

mkdir $WORK_DIR
pushd $WORK_DIR

for package in ${packagesFromSource[@]}; do
    source $SCRIPT_DIR/fromSource/$package

    # Uninstall if already installed
    if command -v $command &> /dev/null; then
	continue
        uninstall
    fi

    # Make sure dependencies are installed
    apt -yq install ${dependencies[*]}

    # Download, checksum and extract source
    downloadFile="./$srcDir.tar.gz"
    curl -s -L $url | tee $downloadFile | sha256sum --quiet -c <(echo "$checksum  -") || \
        { echo "Checksum invalid for $package."; exit 1; }
    tar -xf $downloadFile

    # Build and install
    pushd $srcDir
    install
    cleanup
    popd

    echo "Installed $package."
done

popd
rm -rf $WORK_DIR
