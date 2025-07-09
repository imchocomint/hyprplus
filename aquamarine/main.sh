#! /bin/bash

set -e

VERSION="0.9.0"

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
cd ./aquamarine
if [[ "$COMPUTER_ARCH" == "amd64" ]]; then
    cp ./build-config/amd64-v3.sh ./build-config.sh
elif [[ "$COMPUTER_ARCH" == "x86" ]]; then
    cp ./build-config/i386.sh ./build-config.sh
else
    exit
fi
source ./build-config.sh

echo "$PIKA_BUILD_ARCH" > pika-build-arch

# Get the source tarball
# git clone --recurse-submodules https://github.com/hyprwm/aquamarine
wget https://github.com/hyprwm/aquamarine/archive/refs/tags/v0.9.0.tar.gz
tar -xzf v0.9.0.tar.gz
mv aquamarine-0.9.0 aquamarine
rm v0.9.0.tar.gz
cp -rvf ./debian ./aquamarine/
cd ./aquamarine
DEB_CXXFLAGS_APPEND="-std=c++17" dpkg-buildpackage -us -uc -b
# Get build deps
apt-get build-dep ./ -y

# Build package
LOGNAME=root dh_make --createorig -y -l -p aquamarine_"$VERSION" || echo "dh-make: Ignoring Last Error"
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
sudo rm -rf aquamarine
cd ../
mv ./aquamarine/*.deb ./