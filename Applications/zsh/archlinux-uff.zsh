# Arch Linux Uff tools

# Teams
alias uff-install-teams='yay -S --needed --noconfirm teams'
alias uff-remove-teams='sudo pacman -Rsu --noconfirm teams'

# Zoom
alias uff-install-zoom='yay -S --needed --noconfirm zoom'
alias uff-remove-zoom='rm -rf ~/.config/zoomus.conf ~/.zoom && sudo pacman -Rsu --noconfirm zoom'
