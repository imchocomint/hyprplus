apt update > /dev/null 2>&1
apt install dh-make build-essential git make python3 binutils perl tar gzip bzip2 libgbm-dev libre2-dev libxcb-icccm4-dev libxcb-res0-dev libxcb-errors-dev libtomlplusplus-dev qt6-wayland

# Build hws
./hyprwayland-scanner/main.sh "$@"
bash rename.sh
dpkg -i --force-overwrite hyprwayland-scanner-latest.deb
dpkg -i --force-overwrite libhyprwayland-scanner-dev-latest.deb 
rm -f *.deb

# Build hyprutils
./hyprutils/main.sh "$@"
bash rename.sh
dpkg -i --force-overwrite libhyprutils-latest.deb
dpkg -i --force-overwrite libhyprutils-dev-latest.deb
rm -f *.deb

# Build hyprwire
./hyprwire/main.sh "$@"
bash rename.sh
dpkg -i --force-overwrite libhyprwire-latest.deb
dpkg -i --force-overwrite libhyprwire-dev-latest.deb
rm -f *.deb

# Build hyprlang
./hyprlang/main.sh "$@"
bash rename.sh
dpkg -i --force-overwrite libhyprlang-latest.deb
dpkg -i --force-overwrite libhyprlang-dev-latest.deb
rm -f *.deb

# Build hyprgraphics
./hyprgraphics/main.sh "$@"
bash rename.sh
dpkg -i --force-overwrite libhyprgraphics-latest.deb
dpkg -i --force-overwrite libhyprgraphics-dev-latest.deb
rm -f *.deb

# Build aquamarine
./aquamarine/main.sh "$@"
bash rename.sh
dpkg -i --force-overwrite aquamarine-latest.deb
dpkg -i --force-overwrite libaquamarine-dev-latest.deb
rm -f *.deb

# Build hyprcursor
./hyprcursor/main.sh "$@"
bash rename.sh
dpkg -i --force-overwrite hyprcursor-util-latest.deb
dpkg -i --force-overwrite libhyprcursor-latest.deb
dpkg -i --force-overwrite libhyprcursor-dev-latest.deb
rm -f *.deb

# Build hyprtk
./hyprtoolkit/main.sh "$@"
bash rename.sh
dpkg -i --force-overwrite libhyprtoolkit-latest.deb
dpkg -i --force-overwrite libhyprtoolkit-dev-latest.deb
rm -f *.deb

# Build hgutils
./hyprland-guiutils/main.sh "$@"
bash rename.sh
dpkg -i --force-overwrite hyprland-guiutils-latest.deb
rm -f *.deb

# Build hyprland
./hyprland/main.sh "$@"
bash rename sh
dpkg -i --force-overwrite hyprland-latest.deb
rm -f *.deb

# Build xdph
./xdg-desktop-portal-hyprland/main.sh "$@"
bash rename.sh
dpkg -i --force-overwrite xdg-desktop-portal-hyprland-latest.deb
dpkg -i --force-overwrite xdg-desktop-portal-hyprland-dev-latest.deb
rm -f *.deb

# Rebuild the whole package again
./hyprwayland-scanner/main.sh "$@"
./hyprutils/main.sh "$@"
./hyprwire/main.sh "$@"
./hyprlang/main.sh "$@"
./hyprgraphics/main.sh "$@"
./aquamarine/main.sh "$@"
./hyprcursor/main.sh "$@"
./hyprtoolkit/main.sh "$@"
./hyprland-guiutils/main.sh "$@"
./hyprland/main.sh "$@"
./xdg-desktop-portal-hyprland/main.sh "$@"
bash rename.sh
