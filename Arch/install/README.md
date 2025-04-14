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
