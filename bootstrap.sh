#!/bin/bash

BASE_URL="https://github.com/imchocomint/hyprplus/releases/latest/download/"

all_packages=(
    "aquamarine-dbgsym-latest.deb"
    "aquamarine-latest.deb"
    "hyprcursor-util-dbgsym-latest.deb"
    "hyprcursor-util-latest.deb"
    "hyprland-git-dbgsym-latest.deb"
    "hyprland-git-latest.deb"
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

hyprlang_packages=(
    "libhyprlang-dbgsym-latest.deb"
    "libhyprlang-dev-latest.deb"
    "libhyprlang-latest.deb"
)

hyprutils_packages=(
    "libhyprutils-dbgsym-latest.deb"
    "libhyprutils-dev-latest.deb"
    "libhyprutils-latest.deb"
)

hyprland_git_packages=(
    "hyprland-git-dbgsym-latest.deb"
    "hyprland-git-latest.deb"
)
hyprland_qtutils_packages=(
    "hyprland-qtutils-dbgsym-latest.deb"
    "hyprland-qtutils-latest.deb"
)
xdg_desktop_packages=(
    "xdg-desktop-portal-hyprland-dbgsym-latest.deb"
    "xdg-desktop-portal-hyprland-dev-latest.deb"
    "xdg-desktop-portal-hyprland-latest.deb"
)

declare -A ordered_set
for pkg in "${hyprlang_packages[@]}" "${hyprutils_packages[@]}" "${hyprland_qtutils_packages[@]}" "${hyprland_git_packages[@]}" "${xdg_desktop_packages[@]}"; do
    ordered_set["$pkg"]=1
done

other_packages=()
for pkg in "${all_packages[@]}"; do
    if [[ -z "${ordered_set[$pkg]}" ]]; then
        other_packages+=("$pkg")
    fi
done


DOWNLOAD_DIR="hypr_pkgs"
mkdir -p "$DOWNLOAD_DIR"
cd "$DOWNLOAD_DIR" || { echo "Failed to enter download directory."; exit 1; }

echo "--- Starting download of all Hypr* files ---"

for filename in "${all_packages[@]}"; do
    url="${BASE_URL}${filename}"
    echo "Downloading ${filename}..."
    if ! wget -q --show-progress "$url"; then
        echo "Error: Failed to download ${filename}. Skipping."
    fi
done

echo "--- All downloads complete. Starting installation ---"


install_and_fix() {
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
            sudo dpkg -i "$pkg"
        else
            echo "Warning: ${pkg} not found in download directory. Skipping."
        fi
    done

    echo "Attempting to fix broken dependencies for ${group_name} packages..."
    sudo apt install -f
    echo "Dependency fix attempt complete for ${group_name}."
}

# Install packages in the specified order
install_and_fix hyprlang_packages "libhyprlang"
install_and_fix hyprutils_packages "libhyprutils"
install_and_fix other_packages "other"
install_and_fix hyprland_qtutils_packages "hyprland-qtutils"
install_and_fix hyprland_git_packages "hyprland-git"
install_and_fix xdg_desktop_packages "xdg-desktop-portal-hyprland"

echo ""
echo "--- Installation process complete. ---"
