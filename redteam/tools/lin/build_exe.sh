#!/usr/bin/env bash

# Setup ENV
export GOOS=windows

# Compile DLL for windows using mingw
mkdir -p build
go build --buildvcs=false --ldflags="-H=windowsgui -s -w" \
    -o "build/goDLL.exe" --trimpath .
