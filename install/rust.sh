#!/usr/bin/env sh
set -eux

# https://rust-lang.github.io/rustup/concepts/profiles.html

# Remove big components for every toolchain except stable to save diskspace and traffic on updates
for toolchain in $(rustup toolchain list --quiet | grep -v stable); do
	for component in $(rustup component list --installed --toolchain="$toolchain" | grep -E '^(rust-analyzer|rust-docs)'); do
		rustup component remove "$component" --toolchain="$toolchain"
	done
done

rustup update # update everything in parallel first

rustup set profile minimal
rustup override unset --nonexistent

# minimal stable for like test runners
# rustup toolchain install stable --profile=minimal --component=clippy,rustfmt

rustup toolchain install stable --profile=default \
	--component=rust-analyzer,llvm-tools
rustup toolchain install nightly --profile=minimal \
	--component=clippy,rustfmt,llvm-tools

rustup default stable

mkdir -p ~/.cargo
printf '[unstable]\nrustc-unicode = true\n' >~/.cargo/config.toml

for toolchain in "stable" "nightly"; do
	echo "Install targets for toolchain $toolchain"
	rustup target add --toolchain="$toolchain" \
		wasm32-unknown-unknown
done
