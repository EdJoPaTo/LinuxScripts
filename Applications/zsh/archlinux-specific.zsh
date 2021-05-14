# Arch Linux Specific

alias open='xdg-open'

# make AUR packages with all processor cores
# https://wiki.archlinux.org/index.php/Makepkg#Parallel_compilation
export MAKEFLAGS="-j$(nproc)"

export MANPAGER="bash -c 'col -bx | bat --language man --plain --color=always | less'"

alias paru='nice paru'
alias yay='nice yay'

alias uff-cleanup-zoom='killall -9 zoom; rm -rf ~/.cache/zoom ~/.config/zoomus.conf ~/.zoom'

alias hawvpn='doas openconnect -u abp507 --authgroup="Student*in" --background connect.haw-hamburg.de'
alias hawvpn-stop='doas killall openconnect'
