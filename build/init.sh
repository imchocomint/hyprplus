#!/bin/bash
sudo apt update > /dev/null 2>&1
sudo apt install dh-make build-essential git make python3 binutils perl tar gzip bzip2 libgbm-dev libre2-dev libxcb-icccm4-dev libxcb-res0-dev libxcb-errors-dev libtomlplusplus-dev qt6-wayland
sudo ./hyprwayland-scanner/main.sh "$@"
sudo ./hyprutils/main.sh "$@"
sudo ./hyprwire/main.sh "$@"
sudo ./hyprlang/main.sh "$@"
sudo ./hyprgraphics/main.sh "$@"
sudo ./aquamarine/main.sh "$@"
sudo ./hyprcursor/main.sh "$@"
sudo ./hyprtoolkit/main.sh "$@"
sudo ./hyprland-guiutils/main.sh "$@"
sudo ./hyprland/main.sh "$@"
sudo ./xdg-desktop-portal-hyprland/main.sh "$@"
bash rename.sh