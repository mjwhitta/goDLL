#!/usr/bin/env bash

mkdir -p build

# Setup ENV for EXEs
export GOOS=windows

# Compile EXE for windows
go build --buildvcs=false --ldflags="-H=windowsgui -s -w" \
    -o "build/goDLL.exe" --trimpath .

# Compile loader for DLLs
go build --buildvcs=false --ldflags="-s -w" -o build/loader.exe \
    --trimpath ./loader

# Setup ENV for DLLs
export CC=x86_64-w64-mingw32-gcc
export CGO_ENABLED=1

# Compile DLL for windows using mingw
go build --buildmode=c-shared --buildvcs=false --ldflags="-s -w" \
    -o "build/goDLL.dll" --tags=dll --trimpath .
