#!/usr/bin/env bash
set -e

rustup default stable

# generally used components
rustup component add clippy rustfmt

# needed by rust-analyzer
rustup component add rust-src
