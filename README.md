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

## Guide
### Install GCC/G++ 15 and libstdc++15
For GCC 15, refer to [this](https://github.com/imchocomint/Hyprbian#install-gcc-15-not-applicable-to-experimental).

For libstdc++15, refer to [this](https://github.com/imchocomint/Hyprbian#install-libstdc15).

### Install
Clone this repo, cd to the folder and do ` sudo ./main.sh `

#
Thanks!
