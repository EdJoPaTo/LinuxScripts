#!/usr/bin/env bash
set -e

# Before running run barrier once as a server. This creates the crypto keys needed ot run.


mkdir -p "$HOME/.local/share/barrier"

# verbose relative symbolic force
lnoptions="-vrsf"

ln $lnoptions "$(pwd)/barrier.conf" "$HOME/.local/share/barrier/.barrier.conf"

systemctl enable --user --now barriers.service
