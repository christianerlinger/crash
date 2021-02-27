#!/bin/bash
# how about https://github.com/aBARICHELLO/godot-ci
GODOT_BINARY=~/Godot_v3.2.3/Godot_v3.2.3-stable_x11.64
PROJECT_NAME=crash
BASEDIR=$(pwd)
read -r GAME_VERSION<version
echo build version $GAME_VERSION
rm ./bin -rf
rm ./build -rf
mkdir -p ./bin/linux
mkdir -p ./bin/windows
mkdir -p ./build
$GODOT_BINARY --export "Linux/X11" ./bin/linux/$PROJECT_NAME.x86_64
$GODOT_BINARY --export "Windows Desktop" ./bin/windows/$PROJECT_NAME.exe
pushd bin/windows
tar -zcvf $BASEDIR/build/$PROJECT_NAME-$GAME_VERSION-windows.tar.gz ./
popd
pushd bin/linux
tar -zcvf $BASEDIR/build/$PROJECT_NAME-$GAME_VERSION-linux.tar.gz ./
popd