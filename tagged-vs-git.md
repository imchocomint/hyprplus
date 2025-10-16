This document will explain the difference between Hyprland tagged release (the normal hyprland package) and Hyprland latest git commit (referred as LGC in this document) (the hyprland-git packages).

## Forewords
- You must remove Hyprland LGC before installing Hyprland tagged release; the same applies to the tagged release when you want to install LGC.

## Similarities
- Both are Hyprland
- Both can use the same config
- Both work with Debian

## Differences
### Hyprland tagged release
- Older and may not have the latest bug fixes (of course the hyprwm team will release it later)

### Hyprland LGC
- Have a lot of features, and also bugs
- Have the version error (mentioned in the README)
- Sometimes do not plays nice with the dependencies (e.g. ABI change during 0.49.0 -> 0.50.0)
- In all conditions should work well with dependencies
- Sometimes may not build properly
- Not actively supported

## What to choose
- If you just want to use Hyprland without caring about the bugs: choose Hyprland tagged release
- If you are a tester, or who want to use the latest features: choose Hyprland LGC
