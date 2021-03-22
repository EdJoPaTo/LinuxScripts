#!/usr/bin/env bash
set -e

# See https://github.com/sindresorhus/quick-look-plugins
PLUGINS=(
    apparency
    qlcolorcode
    qlImageSize
    qlmarkdown
    qlstephen
    qlvideo
    quicklook-json
)

brew install "${PLUGINS[@]}"

# Remove the quarantine flag to allow macOS to run these "untrusted" extensions
xattr -d -r com.apple.quarantine ~/Library/QuickLook
