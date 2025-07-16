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
- hyprctl still marks version as 0.49.0; fastfetch didn't (that's on hyprwm team, not me)
- slow download speed over GitHub. May move to another host if persists.

## Guide
### Install GCC/G++ 15 and libstdc++15
For GCC 15, refer to [this](https://github.com/imchocomint/Hyprbian#install-gcc-15-not-applicable-to-experimental).

For libstdc++15, refer to [this](https://github.com/imchocomint/Hyprbian#install-libstdc15).

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
#
Thanks!
