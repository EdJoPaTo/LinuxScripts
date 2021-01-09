#!/bin/sh

mkdir -p ~/.platformio/lib
mkdir -p ~/Arduino/libraries/Credentials

echo ensure 3 \#define are set in ~/Arduino/libraries/Credentials/credentials.h
echo WIFI_SSID WIFI_PASSWORD MQTT_SERVER

ln -srf ~/Arduino/libraries/Credentials ~/.platformio/lib

