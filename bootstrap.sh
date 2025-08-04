#!/bin/bash

# Define the base URL for the package downloads.

BASE_URL="https://github.com/imchocomint/hyprplus/releases/latest/download/"

# if download is slow, uncomment the next line (and thus comment the one above)
# BASE_URL="https://sourceforge.net/projects/hyprplus-mirror/files/1.0-patch01/"

# Define all packages to download and install.
all_packages=(
    "aquamarine-dbgsym-latest.deb"
    "aquamarine-latest.deb"
    "hyprcursor-util-dbgsym-latest.deb"
    "hyprcursor-util-latest.deb"
    "hyprland-git-dbgsym-latest.deb"
    "hyprland-git-latest.deb"
    "hyprland-qt-support-dbgsym-latest.deb"
    "hyprland-qt-support-latest.deb"    
    "hyprland-qtutils-dbgsym-latest.deb"
    "hyprland-qtutils-latest.deb"
    "hyprwayland-scanner-dbgsym-latest.deb"
    "hyprwayland-scanner-latest.deb"
    "libaquamarine-dev-latest.deb"
    "libhyprcursor-dbgsym-latest.deb"
    "libhyprcursor-dev-latest.deb"
    "libhyprcursor-latest.deb"
    "libhyprgraphics-dbgsym-latest.deb"
    "libhyprgraphics-dev-latest.deb"
    "libhyprgraphics-latest.deb"
    "libhyprlang-dbgsym-latest.deb"
    "libhyprlang-dev-latest.deb"
    "libhyprlang-latest.deb"
    "libhyprutils-dbgsym-latest.deb"
    "libhyprutils-dev-latest.deb"
    "libhyprutils-latest.deb"
    "libhyprwayland-scanner-latest.deb"
    "xdg-desktop-portal-hyprland-dbgsym-latest.deb"
    "xdg-desktop-portal-hyprland-dev-latest.deb"
    "xdg-desktop-portal-hyprland-latest.deb"
)

# --- Define package groups based on your requested order ---

hyprutils_packages=(
    "libhyprutils-latest.deb"
    "libhyprutils-dev-latest.deb"
    "libhyprutils-dbgsym-latest.deb"
)

hyprland_packages=(
    "hyprland-git-latest.deb"
    "hyprland-git-dbgsym-latest.deb"
)

hyprcursor_packages=(
    "hyprcursor-util-latest.deb"
    "hyprcursor-util-dbgsym-latest.deb"
    "libhyprcursor-latest.deb"
    "libhyprcursor-dev-latest.deb"
    "libhyprcursor-dbgsym-latest.deb"
)

hyprlang_packages=(
    "libhyprlang-latest.deb"
    "libhyprlang-dev-latest.deb"
    "libhyprlang-dbgsym-latest.deb"
)

hyprgraphics_packages=(
    "libhyprgraphics-latest.deb"
    "libhyprgraphics-dev-latest.deb"
    "libhyprgraphics-dbgsym-latest.deb"
)

aquamarine_packages=(
    "aquamarine-latest.deb"
    "libaquamarine-dev-latest.deb"
    "aquamarine-dbgsym-latest.deb"
)

hyprwayland_scanner_packages=(
    "hyprwayland-scanner-latest.deb"
    "hyprwayland-scanner-dbgsym-latest.deb"
    "libhyprwayland-scanner-latest.deb"
)

hyprland_qtutils_packages=(
    "hyprland-qtutils-latest.deb"
    "hyprland-qtutils-dbgsym-latest.deb"
)

hyprland_qtsupport_packages=(
    "hyprland-qt-support-latest.deb"
    "hyprland-qt-support-dbgsym-latest.deb"
)

xdg_desktop_packages=(
    "xdg-desktop-portal-hyprland-latest.deb"
    "xdg-desktop-portal-hyprland-dev-latest.deb"
    "xdg-desktop-portal-hyprland-dbgsym-latest.deb"
)

# --- Download all packages ---

# Define a directory for downloads.
DOWNLOAD_DIR="hypr_pkgs"
mkdir -p "$DOWNLOAD_DIR"
cd "$DOWNLOAD_DIR" || { echo "Failed to enter download directory."; exit 1; }
echo "--- Installing dependencies ---"
sudo apt install libliftoff0 libqt6core6t64 libqt6gui6 libqt6qml6 libqt6quickcontrols2-6 libqt6widgets6* qml6-module-qtquick-* libxcb* libudis86* libdisplay-info2 libzip5 libzip-dev libtomlplusplus* libmagic1t64 libmagic-dev libmagic-mgc libgles2 libre2-dev libre2-11 
sudo ln -s /usr/lib/x86_64-linux-gnu/libdisplay-info.so.2 /usr/lib/x86_64-linux-gnu/libdisplay-info.so.1
sudo ldconfig
echo "--- Starting download of all Hypr* files ---"

for filename in "${all_packages[@]}"; do
    url="${BASE_URL}${filename}"
    echo "Downloading ${filename}..."
    if ! wget -q --show-progress "$url"; then
        echo "Error: Failed to download ${filename}. Skipping."
    fi
done

echo "--- All downloads complete. Starting installation ---"

# --- Installation function ---
# This function installs a group of packages and attempts to fix dependencies.
install_and_fix() {
    # Use a nameref to reference the array by name.
    local -n pkgs_array=$1
    local group_name=$2

    if [ ${#pkgs_array[@]} -eq 0 ]; then
        echo "No packages in the '${group_name}' group to install."
        return
    fi

    echo ""
    echo "--- Installing ${group_name} packages ---"
    for pkg in "${pkgs_array[@]}"; do
        if [ -f "$pkg" ]; then
            echo "Installing $pkg..."
            # Use sudo to run the installation with elevated privileges.
            sudo dpkg -i --force-overwrite "$pkg"
        else
            echo "Warning: ${pkg} not found in download directory. Skipping."
        fi
    done

    echo "Attempting to fix broken dependencies for ${group_name} packages..."
    # Attempt to install missing dependencies.
    sudo apt install -f
    echo "Dependency fix attempt complete for ${group_name}."
}

install_and_fix hyprutils_packages "libhyprutils"
install_and_fix hyprlang_packages "libhyprlang"
install_and_fix hyprgraphics_packages "libhyprgraphics"
install_and_fix hyprcursor_packages "libhyprcursor"
install_and_fix aquamarine_packages "aquamarine"
install_and_fix hyprwayland_scanner_packages "hyprwayland-scanner"
install_and_fix hyprland_qtsupport_packages "hyprland-qt-support"
install_and_fix hyprland_qtutils_packages "hyprland-qtutils"
install_and_fix hyprland_packages "hyprland-git"
install_and_fix xdg_desktop_packages "xdg-desktop-portal-hyprland"
echo "---- Installation part 1 complete ----"
sleep 3s

echo "If you see errors related to dpkg while installing packages above, please ignore them"
echo "The next few seconds will be used to fix them"
echo "This message will be retained on screen for 10 seconds so you could read and copy the errors if you feel that it is needed"

sleep 10s

echo "Begin installation part 2"
cd hypr_pkgs
sudo dpkg -i --force-overwrite *.deb
sleep 3s
echo "Installation part 2 complete"


echo ""
echo "--- Installation process complete. ---"
echo "Thank you for using my script"
