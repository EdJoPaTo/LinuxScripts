#!/usr/bin/env bash
set -eu

mkdir -p ~/.platformio/lib
mkdir -p ~/Arduino/libraries/Credentials

file="$HOME/Arduino/libraries/Credentials/credentials.h"

insert() {
	rg -q "$1" "$file" 2> /dev/null || echo "$1$2" >> "$file"
}

insert "#pragma once" ''

insert "#define WIFI_SSID " '""'
insert "#define WIFI_PASSWORD " '""'

insert "#define MQTT_SERVER " '""'
insert "#define MQTT_USERNAME " 'NULL'
insert "#define MQTT_PASSWORD " 'NULL'

ln -srf ~/Arduino/libraries/Credentials ~/.platformio/lib

echo "ensure all #define are correct in $file"
