Official SourceForge mirror: https://sourceforge.net/projects/hyprplus-mirror/

Maintained by meoniverse, the team behind LunarXG. Thank you

# Notice
We'll retire some components because someone have been updating the packages on sid repo; also Ubuntu 25.10 repo now have hyprland (latest tagged version).

Some dependencies will be slow to update, and will not work with the latest version of Hyprland. You should check this page regularly for notices.

However Hyprland itself, as well as its Qt tools never got updated. We'll continue to build those packages.

Also please check this out: https://github.com/cpiber/hyprland-ppa. This is for Ubuntu (>=25.10). 

# hyprplus
Project Hyprplus is bringing Hyprland packages (Hyprland and its dependencies) to Debian in the form of native .deb packages

All code is taken, and modified, from PikaOS' [Git repository](https://git.pika-os.com/explore/repos). Big thanks to them.

## Advantages over building manually
- Easily removable and also easier for pushing to Debian's repository
- Can deploy to multiple setups
- you name it.

## Notes for sid user
- some people already uploaded newer hypr* packages to Debian sid repo. These include libhyprutils (and its development libraries), libhyprland (and its development dependencies), libhyprgraphics (same as above), libhyprcursor (same as above), hyprwayland-scanner (same as above) and the XDG portal for Hyprland (same as above).
- However, Hyprland itself is still 10 versions behind, and some crucial packages are not available e.g. Qt tools.

## Progress
90%
- [ ] Refactoring code (there's a similar bash function in each individual build file)
- [ ] Finding maintainers
- [ ] Creating a GUI/TUI application (hyst now in alpha)
- [x] ~~Make installing -dev and -dbgsym packages completely optional~~ We've retired the packages. Some packages we now offers have -dbgsym subpackages; they will still be optional
- [x] This used to be "support other hypr* tools and Wayland utilities". However, most hypr* tools are already uploaded on sid repo. Other Wayland utilities are at https://github.com/imchocomint/wayland-tools-debian
- [ ] Pushing packages to Debian's repositories (the only packages left are hyprland (currently 10 versions behind) and Qt tools)
- [x] making hyprland-git a source-only package

## Quirks
All bugs should be reported in Issues. This is for minor inconvenience.
- (hyprland-git) hyprctl reports one version behind; fastfetch didn't; also hyprctl reports that you're on latest commit. If you want to, just compile and install Hyprland from scratch. Fixed in Hyprland tagged release.
- Slow download speed over GitHub. Mirrored to SourceForge.

## Before installation
### Install GCC/G++ 15 and libstdc++15
#### If you are on Debian sid/experimental/LunarXG Rolling Tidal
Installed on default. Don't worry.

#### If you are on Debian 13/any other Debian 13-based distros
Add unstable repo to system repos. Then install GCC 15 (gcc-15) and G++ 15 (g++-15) via APT.

## Install
# Important: if you installed Hyprland from this repo before Monday, August 11 2025 GMT +7 and never updated, you should boot to tty or other desktop environment/windows manager and remove these packages: `hyprland-git hyprland-git-dbgsym` and rerun the install script.
# Important 2: if you installed Hyprland from this repo before Thursday, October 16 2025 GMT +7 and never updated, you should do a system upgrade (which removes and reinstalls hyprland dependencies) and reinstall from here

## One-script install
```
wget https://raw.githubusercontent.com/imchocomint/hyprplus/refs/heads/main/bootstrap.sh
sudo bash ./bootstrap.sh
```

## Via hyst (currently updating)
## Manually
Go to Releases and download all* packages. First install the dependencies (tba). Then install hyprland-qt-uitls and hyprland-qt-support, then install Hyprland.

- * You may skip packages that end with '-dbgsym'.

## Build (broken)
The building process is being reworked to fit the current release model. Please come back later.

### For hyprland-git
Install all the required dependencies, then build the packages with the init.sh file pointed to /hyprland-git/ directory instead of /hyprland/. Then install like any normal deb-src package.

## QnA
### Package naming?
You can delete the rename script on the build script if you want to release on distros.

### Why are there two version of Hyprland?
[answer here](https://github.com/imchocomint/hyprplus/blob/main/tagged-vs-git.md)

#
Thanks!
