# Arch Linux Specific
if [[ $OSTYPE = linux* ]]; then

alias open='xdg-open'

# make AUR packages with all processor cores
# https://wiki.archlinux.org/index.php/Makepkg#Parallel_compilation
export MAKEFLAGS="-j$(nproc)"

export MANPAGER=most

alias code='nice -n 5 code'
alias makepkg='nice makepkg'
alias paru='nice paru'
alias systemctl='systemctl --no-pager --full'

# use with `uff-install chromium` or `uff-install zoom`
alias uff-install='paru -S --needed --asdeps --noconfirm'
alias uff-cleanup-chromium='killall -9 chromium; rm -rf ~/.cache/chromium; rm -rf ~/.config/*chromium*; doas pacman -R --noconfirm chromium; true'
alias uff-cleanup-zoom='killall -9 zoom; rm -rf ~/.cache/zoom ~/.config/zoomus.conf ~/.zoom; doas pacman -R --noconfirm zoom; true'

alias hawvpn='doas openconnect -u abp507 --authgroup="Student*in" --background connect.haw-hamburg.de'
alias hawvpn-stop='doas killall openconnect'

fi
