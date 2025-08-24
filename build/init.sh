#!/bin/bash
sudo apt update
sudo apt install dh-make build-essential git make python3 binutils perl tar gzip bzip2 libgbm-dev libre2-dev libxcb-icccm4-dev libxcb-res0-dev libxcb-errors-dev libtomlplusplus-dev qt6-wayland rename
sudo ./hyprutils/main.sh "$@"
sudo ./hyprwayland-scanner/main.sh "$@"
sudo ./hyprlang/main.sh "$@"
sudo ./hyprland-qtsupport/main.sh "$@"
sudo ./hyprland-qtutils/main.sh "$@"
sudo ./hyprgraphics/main.sh "$@"
sudo ./aquamarine/main.sh "$@"
sudo ./hyprcursor/main.sh "$@"
sudo ./hyprland-git/main.sh "$@"
sudo ./xdg-desktop-portal-hyprland/main.sh "$@"
bash rename.sh
