#!/usr/bin/env bash
set -eux -o pipefail

rustup default stable
rustup toolchain install nightly

rustup component add llvm-tools-preview
rustup component add llvm-tools-preview --toolchain nightly
rustup component add rust-analyzer

rustup target add wasm32-unknown-unknown
