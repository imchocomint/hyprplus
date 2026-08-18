Official SourceForge mirror: https://sourceforge.net/projects/hyprplus-mirror/

Maintained by meoniverse, the team behind LunarXG. Thank you

# hyprplus
Project Hyprplus is bringing Hyprland packages (Hyprland and its dependencies) to Debian in the form of native .deb packages

All code is taken, and modified, from PikaOS' [Git repository](https://git.pika-os.com/explore/repos). Big thanks to them.

## Why us over the thing on Debian sid repo?
Debian sid version is built broken. Hyprland requires a very much older version of libraries than the current one available. We only push update once Hyprland fully bumps a version, or a hotfix; therefore eliminating the dependencies problem.

## Progress
90%
- [ ] Refactoring code (there's a similar bash function in each individual build file)
- [ ] Finding maintainers
- [ ] Creating a GUI/TUI application (hyst now in alpha)
- [x] ~~Make installing -dev and -dbgsym packages completely optional~~ We've retired the packages. Some packages we now offers have -dbgsym subpackages; they will still be optional
- [x] This used to be "support other hypr* tools and Wayland utilities". However, most hypr* tools are already uploaded on sid repo. Other Wayland utilities are at https://github.com/imchocomint/wayland-tools-debian

## Quirks
All bugs should be reported in Issues. This is for minor inconvenience.
- Slow download speed over GitHub. Mirrored to SourceForge.

## Before installation
- Make sure your system is running on GCC and G++ 15. Debian sid/forky/experimental and Ubuntu 25.10+ already have those. Debian trixie users may have to wait.
- Nothing much in particular

## Install
## One-script install (requires wget)
```
wget https://raw.githubusercontent.com/imchocomint/hyprplus/refs/heads/main/bootstrap.sh
sudo bash ./bootstrap.sh
```

## Via hyst (currently updating)
## Manually

## Build
Clone the repo. Run:

```
cd hyprplus/build
bash init.sh
```

Requires the package `hyprwayland-scanner` to be installed first.

### Packages in 'legacy'
Most of which are packages already sunsetted, or the Debian repo version is good enough. Pretty much you don't need to touch those.

## QnA
### Package naming?
You can delete the rename script on the build script if you want to release on distros.

#
Thanks!
