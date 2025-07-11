#!/bin/bash
sudo apt install dh_make build-essential git make gawk flex bison libgmp-dev libmpfr-dev libmpc-dev python3 binutils perl libisl-dev libzstd-dev tar gzip bzip2
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
