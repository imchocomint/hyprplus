#! /bin/bash

set -e

VERSION="0.51.0git"

function check_architecture() {
    local arch=$(uname -m)
    if [[ "$arch" == "x86_64" ]]; then
        COMPUTER_ARCH="amd64"
    elif [[ "$arch" == "i386" || "$arch" == "i686" ]]; then
        COMPUTER_ARCH="x86"
    else
        COMPUTER_ARCH="else"
        echo "Unsupported architecture"
    fi
    export COMPUTER_ARCH
}
check_architecture
cd ./hyprland-git
if [[ "$COMPUTER_ARCH" == "amd64" ]]; then
    cp ./build-config/amd64-v3.sh ./build-config.sh
elif [[ "$COMPUTER_ARCH" == "x86" ]]; then
    cp ./build-config/i386.sh ./build-config.sh
else
    exit
fi
source ./build-config.sh

echo "$PIKA_BUILD_ARCH" > pika-build-arch

# Clone Upstream
git clone --recurse-submodules https://github.com/hyprwm/hyprland hyprland-0.50.1git
cp -rvf ./debian ./hyprland-0.50.1git/
cd ./hyprland-0.50.1git

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage -S -us -uc

# Move the debs to output
cd ../
sudo rm -rf hyprland
cd ../
mv ./hyprland-git/*.deb ./
