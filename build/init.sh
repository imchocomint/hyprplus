#!/bin/bash
sudo apt update
sudo apt install dh-make build-essential git make python3 binutils perl tar gzip bzip2 libgbm-dev libre2-dev libxcb-icccm4-dev libxcb-res0-dev libxcb-errors-dev libtomlplusplus-dev qt6-wayland rename
sudo ./hyprutils/main.sh "$@"
sudo ./hyprwayland-scanner/main.sh "$@"
sudo ./hyprlang/main.sh "$@"
sudo ./hyprgraphics/main.sh "$@"
sudo ./aquamarine/main.sh "$@"
sudo ./hyprcursor/main.sh "$@"
sudo ./hyprland-git/main.sh "$@"
sudo ./xdg-desktop-portal-hyprland/main.sh "$@"
rename 's/^(libhypr(lang|utils|wayland-scanner|cursor|graphics))(.*)\.deb$/$1-latest.deb/' *.deb
rename 's/^(aquamarine)(.*)\.deb$/$1-latest.deb/' *.deb
rename 's/^(aquamarine-dbgsym)(.*)\.deb$/$1-latest.deb/' *.deb
rename 's/^(libhypr(lang|utils|cursor|graphics)-(d(ev|bgsym)))(.*)\.deb$/$1-latest.deb/' *.deb
rename 's/^(libaquamarine-dev)(.*)\.deb$/$1-latest.deb/' *.deb
rename 's/^(hypr(wayland-scanner|cursor-util|land-git)-dbgsym)(.*)\.deb$/$1-latest.deb/' *.deb
rename 's/^(hypr(wayland-scanner|cursor-util|land-git))(.*)\.deb$/$1-latest.deb/' *.deb
rename 's/^(xdg-desktop-portal-hyprland)(.*)\.deb$/$1-latest.deb/' *.deb
rename 's/^(xdg-desktop-portal-hyprland-(d(ev|bgsym)))(.*)\.deb$/$1-latest.deb/' *.deb