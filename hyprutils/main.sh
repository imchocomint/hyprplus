#! /bin/bash

set -e

VERSION="0.8.0"

source ~/hyprplus/init.sh
cd ~/hyprplus/hyrputils
echo "The architecture in this script is: $COMPUTER_ARCH"
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
git clone --recurse-submodules https://github.com/hyprwm/hyprutils
cp -rvf ./debian ./hyprutils/
cd ./hyprutils

# Get build deps
apt-get build-dep ./ -y

# Build package
LOGNAME=root dh_make --createorig -y -l -p hyprutils_"$VERSION" || echo "dh-make: Ignoring Last Error"
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
