Official SourceForge mirror: https://sourceforge.net/projects/hyprplus-mirror/

Maintained by meoniverse, the team behind LunarXG. Thank you

# hyprplus
Project Hyprplus is bringing Hyprland packages (Hyprland and its dependencies) to Debian in the form of native .deb packages

All code is taken, and modified, from PikaOS' [Git repository](https://git.pika-os.com/explore/repos). Big thanks to them.

## Advantages over building manually
- Easily removable and also easier for pushing to Debian's repository
- Can deploy to multiple setups
- you name it.

## Progress
85%
- [ ] Refactoring code (there's a similar bash function in each individual build file)
- [ ] Finding maintainers
- [ ] Creating a GUI/TUI application (hyst now in alpha)
- [ ] Make installing -dev and -dbgsym packages completely optional
- [ ] Adding more support: multiple other hypr* tools, rofi-wayland, wallust and so on
- [ ] Pushing packages to Debian's repositories ~~(once GCC 15 comes to sid)~~ yay
- [x] making hyprland-git a source-only package

## Quirks
- (hyprland-git) hyprctl still marks version as 0.50.0; fastfetch didn't; also hyprctl reports that you're on latest commit. If you want to, just compile and install Hyprland from scratch. Fixed in Hyprland tagged release.
- Slow download speed over GitHub. Mirrored to SourceForge.

## Guide
### Install GCC/G++ 15 and libstdc++15
#### If you are on Debian sid/experimental/LunarXG Rolling Tidal
Installed on default. Don't worry.

#### If you are on Debian 13/any other Debian 13-based distros
Add unstable repo to system repos. Then install GCC 15 (gcc-15) and G++ 15 (g++-15) via APT.

### Install
# Important: if you installed Hyprland from this repo before Monday, August 11 GMT +7 and never updated, you should boot to tty or other desktop environment/windows manager and remove these packages: `hyprland-git hyprland-git-dbgsym` and rerun the install script.
```
wget https://raw.githubusercontent.com/imchocomint/hyprplus/refs/heads/main/bootstrap.sh
sudo bash ./bootstrap.sh
```

#### For hyprland-git
Install all the required dependencies, then build the packages with the init.sh file pointed to /hyprland-git/ directory instead of /hyprland/.

## Build
Should only be used after installing the packages (this is not an install script since without the .deb packages the build process is broken).
```
git clone https://github.com/imchocomint/hyprplus
cd ./hyprplus/build
sudo ./init.sh
```
All dependencies are installed in the build scripts

## QnA
### Package naming?
You can delete the rename script on the build script if you want to release on distros.

### Why are there two version of Hyprland?
[answer here](https://github.com/imchocomint/hyprplus/blob/main/tagged-vs-git.md)

#
Thanks!
