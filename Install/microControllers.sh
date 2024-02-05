#!/usr/bin/env bash
set -eu -o pipefail

mkdir -p ~/.platformio/lib/Credentials

file="$HOME/.platformio/lib/Credentials/credentials.h"

insert() {
	rg -q "$1" "$file" 2> /dev/null || echo "$1$2" >> "$file"
}

insert "#pragma once" ''

insert "#define WIFI_SSID " '""'
insert "#define WIFI_PASSWORD " '""'

insert "#define MQTT_SERVER " '""'
insert "#define MQTT_USERNAME " 'NULL'
insert "#define MQTT_PASSWORD " 'NULL'

# When using with Arduino comment this out
# mkdir -p ~/Arduino/libraries
# ln -srf ~/.platformio/lib/Credentials ~/Arduino/libraries

echo "ensure all #define are correct in $file"
