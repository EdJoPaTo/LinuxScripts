#!/usr/bin/env bash
set -eu -o pipefail

# https://rust-lang.github.io/rustup/concepts/profiles.html

rustup set profile minimal
rustup override unset --nonexistent

# minimal stable for like test runners
# rustup toolchain install stable --profile=minimal --component=clippy,rustfmt

rustup toolchain install stable --profile=default \
	--component=rust-analyzer,llvm-tools
rustup toolchain install nightly --profile=minimal \
	--component=clippy,rustfmt,llvm-tools

rustup default stable

targets=(
	wasm32-unknown-unknown
)
for target in "${targets[@]}"; do
	for toolchain in "stable" "nightly"; do
		echo "Install target $target for toolchain $toolchain"
		rustup target add --toolchain="$toolchain" "$target"
	done
done

# Remove big components for every toolchain except stable to save diskspace and traffic on updates
for toolchain in $(rustup toolchain list --quiet | rg -v stable); do
	installed=$(rustup component list --installed --toolchain="$toolchain")
	for component in "rust-analyzer" "rust-docs"; do
		if echo "$installed" | grep -q "$component"; then
			echo "On toolchain $toolchain remove component $component"
			rustup component remove rust-docs --toolchain="$toolchain"
		fi
	done
done
