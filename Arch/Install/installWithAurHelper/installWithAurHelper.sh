#!/bin/bash

helper="yaourt"
param="--noconfirm --needed -Sy"

$helper $param "$@"
