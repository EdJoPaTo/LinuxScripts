#!/usr/bin/env sh
set -eu

server=$1

arch=$(ssh "$server" -- uname -m)
case "$arch" in
x86_64)
	TARGET=x86_64-unknown-linux-gnu
	;;
aarch64)
	TARGET=aarch64-unknown-linux-gnu
	;;
armv7l)
	TARGET=armv7-unknown-linux-gnueabihf
	;;
armv6l)
	TARGET=arm-unknown-linux-gnueabihf
	;;
*)
	echo "Unknown rust target triple of $server: $arch"
	exit 1
	;;
esac
echo "$arch uses target triple $TARGET"
set -x

cross build --release --target $TARGET
debpath=$(cargo deb --no-build --no-strip --target $TARGET)

debname=$(basename "$debpath")

rsync \
	--copy-links --times \
	--checksum \
	--info=progress2 \
	"$debpath" "$server:/tmp/$debname"

ssh -l root "$server" -- dpkg --force-bad-verify -i "/tmp/$debname"

ssh "$server" -- rm "/tmp/$debname"
