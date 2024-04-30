#!/usr/bin/env bash

# Setup ENV
export CC=x86_64-w64-mingw32-gcc
export CGO_ENABLED=1
export GOOS=windows

# Compile DLL for windows using mingw
mkdir -p build
go build --buildmode=c-shared --buildvcs=false --ldflags="-s -w" \
    -o "build/goDLL.dll" --tags=dll --trimpath .