#!/bin/bash
sudo ./hyprutils/main.sh "$@"
sudo dpkg -i *.deb
rm *.deb
./hyprwayland-scanner/main.sh "$@"
sudo dpkg -i *.deb
rm *.deb
./hyprgraphics/main.sh "$@"
sudo dpkg -i *.deb
rm *.deb
./aquamarine/main.sh "$@"
sudo dpkg -i *.deb
rm *.deb
