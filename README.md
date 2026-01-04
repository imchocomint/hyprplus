# ~~TEMPORARILY STOPPING DEVELOPMENT (DEBIAN REPO ALREADY HAVE THOSE). THANK YOU~~
# LMAO THEY SUMMONED ME BACK SINCE HYPRWIRE IS STILL STUCK

Official SourceForge mirror: https://sourceforge.net/projects/hyprplus-mirror/

Maintained by meoniverse, the team behind LunarXG. Thank you

# Notice
We'll retire some components because someone have been updating the packages on sid repo; also Ubuntu 25.10 repo now have hyprland (latest tagged version).

Some dependencies will be slow to update, and will not work with the latest version of Hyprland. You should check this page regularly for notices.

~~However Hyprland itself, as well as its Qt tools never got updated. We'll continue to build those packages.~~

The above line used to be wrong, but now hyprland update on Debian is stagnated so we're here.

We will not package hyprtoolkit. Future releases will not have the donation pop-up and such. However if Hyprland malfunctions I will try my best to package it.

hyprwire can be installed either here or by manually compiling [from this repo](https://github.com/imchocomint/hyprwire-debian). They are technically the same; the only differrent is that our packages provides more in one.

# hyprplus
Project Hyprplus is bringing Hyprland packages (Hyprland and its dependencies) to Debian in the form of native .deb packages

All code is taken, and modified, from PikaOS' [Git repository](https://git.pika-os.com/explore/repos). Big thanks to them.

## Advantages over building manually
- Easily removable and also easier for pushing to Debian's repository
- Can deploy to multiple setups
- you name it.

## Progress
90%
- [ ] Refactoring code (there's a similar bash function in each individual build file)
- [ ] Finding maintainers
- [ ] Creating a GUI/TUI application (hyst now in alpha)
- [x] ~~Make installing -dev and -dbgsym packages completely optional~~ We've retired the packages. Some packages we now offers have -dbgsym subpackages; they will still be optional
- [x] This used to be "support other hypr* tools and Wayland utilities". However, most hypr* tools are already uploaded on sid repo. Other Wayland utilities are at https://github.com/imchocomint/wayland-tools-debian
- [x] Checked because Hyprland now is available on sid repo.

## Quirks
All bugs should be reported in Issues. This is for minor inconvenience.
- Slow download speed over GitHub. Mirrored to SourceForge.

## Before installation
- Make sure your system is running on GCC and G++ 15. Debian sid/forky/experimental and Ubuntu 25.10 already have those. Debian trixie users may have to wait.
- Nothing much in particular

## Install
## One-script install
```
wget https://raw.githubusercontent.com/imchocomint/hyprplus/refs/heads/main/bootstrap.sh
sudo bash ./bootstrap.sh
```

## Via hyst (currently updating)
## Manually
Go to Releases and download all* packages. Install hyprwire, then hyprland. It will automatically install the missing dependencies.

- * You may skip packages that end with '-dbgsym'.

## Build (broken)
The building process is being reworked to fit the current release model. Please come back later.

### Packages in 'legacy'
These packages were dependencies for Hyprland, but they are now available and maintained on Debian repo. Once no one maintain them, these will be pulled out of legacy and updated.

## QnA
### Package naming?
You can delete the rename script on the build script if you want to release on distros.

#
Thanks!
