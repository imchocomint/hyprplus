# hyprplus
Project Hyprplus is bringing Hyprland packages (Hyprland and its dependencies) to Debian in the form of native .deb packages

All code is taken, and modified, from PikaOS' [Git repository](https://git.pika-os.com/explore/repos). Big thanks to them.

The project will be the base for [Repologist](https://worktree.ca/meowniverse/repologist).

## Advantages over building manually
- Easily removable and also easier for pushing to Debian's repository
- Can deploy to multiple setups
- you name it.

## Progress
92%
- [x] Refactoring code (there's a similar bash function in each individual build file)
- [ ] Finding maintainers
- [ ] Creating a GUI/TUI application
- [ ] Adding more support
- [ ] Pushing packages to Debian's repositories (once GCC 15 comes to sid)

## Quirks
- hyprctl still marks version as 0.50.0; fastfetch didn't; also hyprctl reports that you're on latest commit. If you want to, just compile and install Hyprland from scratch.
- Slow download speed over GitHub. May move to another host if persists. Please recommend me some good Git services or free file hosting services since Worktree limit to 1GB of all packages for all repos.

## Guide
### Install GCC/G++ 15 and libstdc++15
#### If you are not on Debian experimental/LunarXG Rolling Tidal
For GCC 15, refer to [this](https://github.com/imchocomint/Hyprbian#install-gcc-15-not-applicable-to-experimental).

For libstdc++15, refer to [this](https://github.com/imchocomint/Hyprbian#install-libstdc15).

#### If you are on Debian experimental/LunarXG Rolling Tidal
Installed on default. Don't worry.

#### If you are on Debian sid
Add experimental repos to system repos. Then install GCC 15 (gcc-15) and G++ 15 (g++-15) via APT.

### Install
```
wget https://github.com/imchocomint/hyprplus/blob/main/bootstrap.sh
sudo bash ./bootstrap.sh
```

## Build
Should only be used after installing the packages (this is not an install script since without the .deb packages the build process is broken).
```
git clone https://github.com/imchocomint/hyprplus
cd hyprplus
cd build
sudo ./init.sh
```
All dependencies are installed in the build scripts

## QnA
### Package naming?
You can delete the rename script on the build script if you want to release on distros.

#
Thanks!
