new-item -erroraction silentlycontinue -itemtype directory `
    -path ./build | out-null

# Compile EXE for windows
go build --buildvcs=false --ldflags="-H=windowsgui -s -w" `
    -o ./build/goDLL.exe --trimpath .

# Compile loader for DLLs
if (test-path ./loader) {
    go build --buildvcs=false --ldflags="-s -w" `
        -o ./build/loader.exe --trimpath ./loader
} elseif (test-path ../loader) {
    go -C ../ build --buildvcs=false --ldflags="-s -w" `
        -o ./redteam/build/loader.exe --trimpath ./loader
}

# Setup ENV for DLLs
$env:CGO_ENABLED=1

# Compile DLL for windows using mingw
go build --buildmode=c-shared --buildvcs=false --ldflags="-s -w" `
    -o ./build/goDLL.dll --tags=dll --trimpath .
