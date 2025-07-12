# hyprplus
Project Hyprplus is bringing Hyprland packages (Hyprland and its dependencies) to Debian in the form of native .deb packages

All code is taken, and modified, from PikaOS' [Git repository](https://git.pika-os.com/explore/repos). Big thanks to them.

The project will be the base for [Repologist](https://worktree.ca/meowniverse/repologist).

## Advantages over building manually
- Easily removable and also easier for pushing to Debian's repository
- Can deploy to multiple setups (if .deb files are kept; which isn't in this case)
- you name it.

## Progress
92%
- [x] Refactoring code (there's a similar bash function in each individual build file)
- [ ] Finding maintainers
- [ ] Creating a GUI/TUI application
- [ ] Adding more support
- [ ] Pushing packages to Debian's repositories (once GCC 15 comes to sid)

## Quirks
### xdg-desktop-portal-hyprland refuses to install/installed incorrectly (dependencies problem)
If installed, remove in this order: xdg-desktop-portal-hyprland-dbgsym, xdg-desktop-portal-hyprland-dev and then xdg-desktop-portal-hyprland using dpkg.

Delete everything inside the init.sh script, except the build xdg-desktop-portal-hyprland part and the shebang line. Run the script again to get the .deb files.

Once finished, install by this order: xdg-desktop-portal-hyprland, and xdg-desktop-portal-hyprland-dev and xdg-desktop-portal-hyprland-dbgsym in either order.

### Hyprland is not at latest commit (as of July 12 2025)
Currently there're issues with the latest Hyprland commits, and we have to fall back to commit ` 523eed048e91da9b99c73a48f365ad52f11ae690 `. Once fixed we will return to latest commits.

## Guide
### Install GCC/G++ 15 and libstdc++15
For GCC 15, refer to [this](https://github.com/imchocomint/Hyprbian#install-gcc-15-not-applicable-to-experimental).

For libstdc++15, refer to [this](https://github.com/imchocomint/Hyprbian#install-libstdc15).

### Install
Clone this repo, cd to the folder and do ` sudo ./init.sh `

#
Thanks!
