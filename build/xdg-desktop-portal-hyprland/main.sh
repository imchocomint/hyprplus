#! /bin/bash

set -e

VERSION="1.3.10"

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
cd ./xdg-desktop-portal-hyprland
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
git clone --depth=1 --recurse-submodules https://github.com/hyprwm/xdg-desktop-portal-hyprland.git
cp -rvf ./debian ./xdg-desktop-portal-hyprland/
cd ./xdg-desktop-portal-hyprland

# Get build deps
apt-get build-dep ./ -y

# Build package
LOGNAME=root dh_make --createorig -y -l -p xdg-desktop-portal-hyprland_"$VERSION" || echo "dh-make: Ignoring Last Error"
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
sudo rm -rf xdg-desktop-portal-hyprland
cd ../
mv ./xdg-desktop-portal-hyprland/*.deb ./