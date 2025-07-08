#! /bin/bash

set -e

VERSION="0.8.0"

source ./pika-build-config.sh

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
