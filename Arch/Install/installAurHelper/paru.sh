#!/usr/bin/sh
set -e

./installaurpackage.sh paru-bin

mkdir -p ~/.config/paru
cat > ~/.config/paru/paru.conf << EOF
[options]
BatchInstall
CombinedUpgrade
Devel
UpgradeMenu

[bin]
Sudo = doas
EOF

paru --gendb
