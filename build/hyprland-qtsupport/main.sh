#! /bin/bash

set -e

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
cd ./hyprland-qtsupport
if [[ "$COMPUTER_ARCH" == "amd64" ]]; then
    cp ./build-config/amd64-v3.sh ./build-config.sh
elif [[ "$COMPUTER_ARCH" == "x86" ]]; then
    cp ./build-config/i386.sh ./build-config.sh
else
    exit
fi
source ./build-config.sh

echo "$PIKA_BUILD_ARCH" > pika-build-arch

VERSION="0.1.0"

# Clone Upstream
git clone --recurse-submodules https://github.com/hyprwm/hyprland-qt-support
cp -rvf ./debian ./hyprland-qt-support/
cd ./hyprland-qt-support/

# Get build deps
LOGNAME=root dh_make -n -y -l -p hyprland-qt-support_"$VERSION" || echo "dh-make: Ignoring Last Error"
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
sudo rm -rf hyprland-qt-support
cd ../
mv ./hyprland-qt-support/*.deb ../