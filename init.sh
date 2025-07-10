#!/bin/bash
./hyprutils/main.sh "$@"
sudo dpkg -i *.deb
rm *.deb
./hyprwayland-scanner/main.sh "$@"
sudo dpkg -i *.deb
rm *.deb
./hyprlang/main.sh "$@"
sudo dpkg -i *.deb
rm *.deb
./hyprgraphics/main.sh "$@"
sudo dpkg -i *.deb
rm *.deb
./aquamarine/main.sh "$@"
sudo dpkg -i *.deb
rm *.deb
./hyprcursor/main.sh "$@"
sudo dpkg -i *.deb
rm *.deb
./xdg-desktop-portal-hyprland/main.sh "$@"
sudo dpkg -i *.deb
rm *.deb
./hyprland-git/main.sh "$@"
sudo dpkg -i *.deb
rm *.deb