#!/bin/bash
sudo ./hyprutils/main.sh "$@"
sudo dpkg -i *.deb
rm *.deb
./hyprgraphics/main.sh "$@"
sudo dpkg -i *.deb
rm *.deb

