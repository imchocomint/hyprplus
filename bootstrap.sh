#!/bin/bash

# Define the base URL for the package downloads.

BASE_URL="https://github.com/imchocomint/hyprplus/releases/latest/download/"

# BASE_URL="https://sourceforge.net/projects/hyprplus-mirror/files/<release tag>/"

# Define all packages to download and install.
all_packages=(
    "hyprland-dbgsym-latest.deb"
    "hyprland-latest.deb"  
    "hyprland-qtutils-dbgsym-latest.deb"
    "hyprland-qtutils-latest.deb"
    "libhyprwire-latest.deb"
    "libhyprwire-dev-latest.deb"
    "libhyprwire-dbgsym-latest.deb"
)


hyprland_packages=(
    "hyprland-latest.deb"
    "hyprland-dbgsym-latest.deb"
)
hyprwire_packages=(
    "libhyprwire-latest.deb"
    "libhyprwire-dev-latest.deb"
    "libhyprwire-dbgsym-latest.deb"
)

hyprland_qtutils_packages=(
    "hyprland-qtutils-latest.deb"
    "hyprland-qtutils-dbgsym-latest.deb"
)


DOWNLOAD_DIR="hyprplus"
mkdir -p "$DOWNLOAD_DIR"
cd "$DOWNLOAD_DIR" || { echo "Failed to enter download directory."; exit 1; }
echo "--- Installing dependencies ---"
sudo apt install libliftoff0 libqt6core6t64 libqt6gui6 libqt6qml6 libqt6quickcontrols2-6 libqt6widgets6* qml6-module-qtquick-* libxcb* libudis86* libdisplay-info2 libzip5 libzip-dev libtomlplusplus* libmagic1t64 libmagic-dev libmagic-mgc libgles2 libre2-dev libre2-11 
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

install_and_fix hyprland_qtutils_packages "hyprland-qtutils"
install_and_fix hyprwire_packages "hyprwire"
install_and_fix hyprland_packages "hyprland"

echo ""
echo "--- Installation process complete. ---"

