# Generate versioninfo
if (get-command -erroraction silentlycontinue goversioninfo) {
    goversioninfo --platform-specific
    powershell -c "cd loader; goversioninfo --platform-specific"
}

# Compile EXE for windows
mkdir build -erroraction silentlycontinue | out-null
go build --buildvcs=false --ldflags="-H=windowsgui -s -w" `
    -o "build/goDLL.exe" --trimpath .

# Compile loader for DLLs
mkdir build -erroraction silentlycontinue | out-null
go build --buildvcs=false --ldflags="-s -w" -o build/loader.exe `
    --trimpath ./loader

# Setup ENV for DLLs
$env:CGO_ENABLED=1

# Compile DLL for windows using mingw
mkdir build -erroraction silentlycontinue | out-null
go build --buildmode=c-shared --buildvcs=false --ldflags="-s -w" `
    -o "build/goDLL.dll" --tags=dll --trimpath .

get-childitem -name -recurse | findstr resource_windows | `
    %{rm -force $_}
