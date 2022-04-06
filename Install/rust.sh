#!/usr/bin/env bash
set -eux

COMPONENTS=(
	clippy
	rustfmt

	rust-src # rust-analyzer
)

rustup default stable
rustup toolchain install nightly

rustup target add wasm32-unknown-unknown

rustup component add "${COMPONENTS[@]}"
rustup component add --toolchain nightly "${COMPONENTS[@]}"
