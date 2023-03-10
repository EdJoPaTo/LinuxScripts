# Uff packages are for some reason not included in the default installation
# Either they are big and not often used, include AUR stuff that needs to be built or seem poisonous for the system
# Also a place to fade out possibly unused packages

# Arch Linux
if type paru >/dev/null; then
	TMP_PACKAGES=(
		alma-git
		cargo-license
		chromium
		devtools
		esphome
		etcher-bin
		gnome-characters
		gnome-info-collect
		gucharmap
		mqtt-explorer-appimage
		pandoc
		steam
		ttf-ms-fonts
		ventoy-bin
		vim
		zoom
	)

	uff-cache() {
		paru -S --downloadonly --needed --noconfirm "${TMP_PACKAGES[@]}"
	}
	uff-uninstall() {
		doas pacman -Rc $(pacman -Qq "${TMP_PACKAGES[@]}" 2>/dev/null) && paru --clean
	}
	uff-install() {
		paru -S --asdeps --needed $(printf "%s\n" "${TMP_PACKAGES[@]}" | fzf --multi --exit-0 --preview='paru -Si {}')
	}

	uff-cleanup-chromium() {
		killall -9 chromium
		rm -rf ~/.cache/chromium
		rm -rf ~/.config/*chromium*
		doas pacman -R --noconfirm chromium; true
	}
	uff-cleanup-zoom() {
		killall -9 zoom
		rm -rf ~/.cache/zoom ~/.config/zoomus.conf ~/.zoom
		doas pacman -R --noconfirm zoom; true
	}

# macOS
elif type brew >/dev/null; then
	TMP_PACKAGES=(
		chromium
	)

	uff-uninstall() {
		brew uninstall --force "${TMP_PACKAGES[@]}"
	}
	uff-install() {
		brew install --cask --no-quarantine $(printf "%s\n" "${TMP_PACKAGES[@]}" | fzf --multi --exit-0 --preview='brew info {}')
	}

else
	echo "system unclear to uff - do nothing"
fi
