#!/usr/bin/env bash
command='alacritty'
url='https://github.com/alacritty/alacritty/archive/refs/tags/v0.10.1.tar.gz'
checksum='e48d4b10762c2707bb17fd8f89bd98f0dcccc450d223cade706fdd9cfaefb308'
srcDir='alacritty-0.10.1'
apt_packages=(
    cmake
    pkg-config
    libfreetype6-dev
    libfontconfig1-dev
    libxcb-xfixes0-dev
    libxkbcommon-dev
    python3
)

install () {
    # Build
    cargo build --release -j $(nproc)

    # Copy files
    sudo cp target/release/alacritty /usr/local/bin
    sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
    sudo desktop-file-install extra/linux/Alacritty.desktop
    sudo update-desktop-database
}

uninstall () {
    sudo rm '/usr/local/bin/alacritty'
    sudo rm '/usr/share/pixmaps/Alacritty.svg'
    sudo rm '/usr/share/applications/Alacritty.desktop'
    sudo update-desktop-database
}

