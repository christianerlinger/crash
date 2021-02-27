#!/bin/sh
GODOT_BINARY=~/Godot_v3.2.3/Godot_v3.2.3-stable_x11.64
rm ./bin -rf
mkdir -p ./bin/linux
mkdir -p ./bin/windows
$GODOT_BINARY --export "Linux/X11" ./bin/linux/crash.x86_64
$GODOT_BINARY --export "Windows Desktop" ./bin/windows/crash.exe