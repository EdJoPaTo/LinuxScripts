#!/usr/bin/env bash
set -e

rustup toolchain install nightly

# generally used components
rustup component add --toolchain nightly clippy rustfmt

rustup component add --toolchain nightly rust-src
