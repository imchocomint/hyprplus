#!/bin/bash
sudo apt update
sudo apt install dh-make build-essential git make python3 binutils perl tar gzip bzip2 libgbm-dev libre2-dev libxcb-icccm4-dev libxcb-res0-dev libxcb-errors-dev libtomlplusplus-dev
sudo ./hyprutils/main.sh "$@"
sudo dpkg -i *.deb
rm *.deb
sudo ./hyprwayland-scanner/main.sh "$@"
sudo dpkg -i *.deb
rm *.deb
sudo ./hyprlang/main.sh "$@"
sudo dpkg -i *.deb
rm *.deb
sudo ./hyprgraphics/main.sh "$@"
sudo dpkg -i *.deb
rm *.deb
sudo ./aquamarine/main.sh "$@"
sudo dpkg -i *.deb
rm *.deb
sudo ./hyprcursor/main.sh "$@"
sudo dpkg -i *.deb
rm *.deb
sudo ./xdg-desktop-portal-hyprland/main.sh "$@"
sudo dpkg -i *.deb
rm *.deb
sudo ./hyprland-git/main.sh "$@"
sudo dpkg -i *.deb
rm *.deb
