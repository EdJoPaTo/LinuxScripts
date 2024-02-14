# Arch Linux Package Install Scripts

Scripts to install my Arch Linux Packages.

The basic idea is to install everything as a dependency and then mark some as explictly installed.
This way dependency / explicitly relations are handled well.

This also simplifies finding randomly installed stuff not by this script:

- Mark everything as installed by dependency:
  `doas pacman -D --asdeps $(pacman -Qqe)`.
- Run the given scripts
- Run `paru --clean` to remove (or see) the not needed packages.
  If something interesting is in there, add it to one of these scripts in here and it will also be installed on fresh devices.
  The rest can manually marked as explicit while they are still in "are they useful" testing or simply be removed.

## Folders

Scripts in this folder (not subdirectory) are in order to install stuff from the main repositories via `pacman`.
They are called with `doas` (or `sudo`) like this: `doas ./main.sh`.

Scripts in the subfolder `installAurHelper` install AUR helpers like `paru`.

Scripts in the subfolder `asUser` install AUR packages with the AUR helper defined in `asUser/installWithAurHelper.sh` (currently `paru`).
They are run as user as AUR packages should/have to be built as user and not as `root`.
