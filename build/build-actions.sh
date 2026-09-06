sudo apt update > /dev/null 2>&1
sudo apt install dh-make build-essential git make python3 binutils perl tar gzip bzip2 libgbm-dev libre2-dev libxcb-icccm4-dev libxcb-res0-dev libxcb-errors-dev libtomlplusplus-dev qt6-wayland

# Build hws
sudo ./hyprwayland-scanner/main.sh "$@"
bash rename.sh
sudo dpkg -i --force-overwrite hyprwayland-scanner-latest.deb
sudo dpkg -i --force-overwrite libhyprwayland-scanner-dev-latest.deb 
rm -f *.deb

# Build hyprutils
sudo ./hyprutils/main.sh "$@"
bash rename.sh
sudo dpkg -i --force-overwrite libhyprutils-latest.deb
sudo dpkg -i --force-overwrite libhyprutils-dev-latest.deb
rm -f *.deb

# Build hyprwire
sudo ./hyprwire/main.sh "$@"
bash rename.sh
sudo dpkg -i --force-overwrite libhyprwire-latest.deb
sudo dpkg -i --force-overwrite libhyprwire-dev-latest.deb
rm -f *.deb

# Build hyprlang
sudo ./hyprlang/main.sh "$@"
bash rename.sh
sudo dpkg -i --force-overwrite libhyprlang-latest.deb
sudo dpkg -i --force-overwrite libhyprlang-dev-latest.deb
rm -f *.deb

# Build hyprgraphics
sudo ./hyprgraphics/main.sh "$@"
bash rename.sh
sudo dpkg -i --force-overwrite libhyprgraphics-latest.deb
sudo dpkg -i --force-overwrite libhyprgraphics-dev-latest.deb
rm -f *.deb

# Build aquamarine
sudo ./aquamarine/main.sh "$@"
bash rename.sh
sudo dpkg -i --force-overwrite aquamarine-latest.deb
sudo dpkg -i --force-overwrite libaquamarine-dev-latest.deb
rm -f *.deb

# Build hyprcursor
sudo ./hyprcursor/main.sh "$@"
bash rename.sh
sudo dpkg -i --force-overwrite hyprcursor-util-latest.deb
sudo dpkg -i --force-overwrite libhyprcursor-latest.deb
sudo dpkg -i --force-overwrite libhyprcursor-dev-latest.deb
rm -f *.deb

# Build hyprtk
sudo ./hyprtoolkit/main.sh "$@"
bash rename.sh
sudo dpkg -i --force-overwrite libhyprtoolkit-latest.deb
sudo dpkg -i --force-overwrite libhyprtoolkit-dev-latest.deb
rm -f *.deb

# Build hgutils
sudo ./hyprland-guiutils/main.sh "$@"
bash rename.sh
sudo dpkg -i --force-overwrite hyprland-guiutils-latest.deb
rm -f *.deb

# Build hyprland
sudo ./hyprland/main.sh "$@"
bash rename sh
sudo dpkg -i --force-overwrite hyprland-latest.deb
rm -f *.deb

# Build xdph
sudo ./xdg-desktop-portal-hyprland/main.sh "$@"
bash rename.sh
sudo dpkg -i --force-overwrite xdg-desktop-portal-hyprland-latest.deb
sudo dpkg -i --force-overwrite xdg-desktop-portal-hyprland-dev-latest.deb
rm -f *.deb

# Rebuild the whole package again
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
