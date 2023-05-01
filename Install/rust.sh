#!/usr/bin/env bash
set -eux

rustup default stable
rustup toolchain install nightly

rustup component add rust-analyzer

rustup target add wasm32-unknown-unknown
