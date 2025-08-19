standard_pkgs = [
    # "aquamarine-dbgsym-latest.deb"
    "aquamarine-latest.deb",
    # "hyprcursor-util-dbgsym-latest.deb"
    "hyprcursor-util-latest.deb",
    # "hyprland-dbgsym-latest.deb"
    "hyprland-latest.deb",
    # "hyprland-qt-support-dbgsym-latest.deb"
    "hyprland-qt-support-latest.deb"  ,  
    # "hyprland-qtutils-dbgsym-latest.deb"
    "hyprland-qtutils-latest.deb",
    # "hyprwayland-scanner-dbgsym-latest.deb"
    "hyprwayland-scanner-latest.deb",
    # "libaquamarine-dev-latest.deb"
    # "libhyprcursor-dbgsym-latest.deb"
    # "libhyprcursor-dev-latest.deb"
    "libhyprcursor-latest.deb",
    # "libhyprgraphics-dbgsym-latest.deb"
    # "libhyprgraphics-dev-latest.deb"
    "libhyprgraphics-latest.deb",
    # "libhyprlang-dbgsym-latest.deb"
    # "libhyprlang-dev-latest.deb"
    "libhyprlang-latest.deb",
    # "libhyprutils-dbgsym-latest.deb"
    # "libhyprutils-dev-latest.deb"
    "libhyprutils-latest.deb",
    "libhyprwayland-scanner-latest.deb",
    # "xdg-desktop-portal-hyprland-dbgsym-latest.deb"
    # "xdg-desktop-portal-hyprland-dev-latest.deb"
    "xdg-desktop-portal-hyprland-latest.deb"]

dev_pkgs =[
    "libaquamarine-dev-latest.deb",
    "libhyprcursor-dev-latest.deb",
    "libhyprgraphics-dev-latest.deb",
    "libhyprlang-dev-latest.deb",
    "libhyprutils-dev-latest.deb",
    "xdg-desktop-portal-hyprland-dev-latest.deb",
]

dbgsym_pkgs = [
    "aquamarine-dbgsym-latest.deb",
    "hyprcursor-util-dbgsym-latest.deb",
    "hyprland-dbgsym-latest.deb",
    "hyprland-qt-support-dbgsym-latest.deb",
    "hyprland-qtutils-dbgsym-latest.deb",
    "hyprwayland-scanner-dbgsym-latest.deb",
    "libhyprcursor-dbgsym-latest.deb",
    "libhyprgraphics-dbgsym-latest.deb",
    "libhyprlang-dbgsym-latest.deb",
    "libhyprutils-dbgsym-latest.deb",
    "xdg-desktop-portal-hyprland-dbgsym-latest.deb"
]

hyprutils_packages=[
    "libhyprutils-latest.deb"
]

hyprland_packages=[
    "hyprland-git-latest.deb"
]

hyprcursor_packages=[
    "hyprcursor-util-latest.deb",
    "libhyprcursor-latest.deb"
]

hyprlang_packages=[
    "libhyprlang-latest.deb"
]

hyprgraphics_packages=[
    "libhyprgraphics-latest.deb"
]

aquamarine_packages=[
    "aquamarine-latest.deb"
]

hyprwayland_scanner_packages=[
    "hyprwayland-scanner-latest.deb",
    "libhyprwayland-scanner-latest.deb"
]

hyprland_qtutils_packages=[
    "hyprland-qtutils-latest.deb"
]

hyprland_qtsupport_packages=[
    "hyprland-qt-support-latest.deb"
]

xdg_desktop_packages=[
    "xdg-desktop-portal-hyprland-latest.deb"
]
cmd_mkdir = "mkdir ./hyprplus"
cmd_rm = "rm -rf ./hyprplus"
cmd_pres = "sudo apt install libliftoff0 libqt6core6t64 libqt6gui6 libqt6qml6 libqt6quickcontrols2-6 libqt6widgets6* qml6-module-qtquick-* libxcb* libudis86* libdisplay-info2 libzip5 libzip-dev libtomlplusplus* libmagic1t64 libmagic-dev libmagic-mgc libgles2 libre2-dev libre2-11"
cmd_linklib1 = "sudo ln -s /usr/lib/x86_64-linux-gnu/libdisplay-info.so.2 /usr/lib/x86_64-linux-gnu/libdisplay-info.so.1"
cmd_linklib2 = "sudo ldconfig"
cmd_install = "sudo dpkg -i --force-overwrite {pkgs}"
cmd_fixdep = "sudo apt install -f"
dl_cmd = "wget {mirror_url} -O {pkgs}"