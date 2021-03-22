#!/usr/bin/env bash
set -e

# See https://github.com/sindresorhus/quick-look-plugins
PACKAGES=(
    apparency
    qlcolorcode
    qlImageSize
    qlmarkdown
    qlstephen
    qlvideo
    quicklook-json
)

brew reinstall "${PACKAGES[@]}"

# Remove the quarantine flag to allow macOS to run these "untrusted" extensions
xattr -d -r com.apple.quarantine ~/Library/QuickLook
