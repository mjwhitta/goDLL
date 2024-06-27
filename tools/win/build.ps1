mkdir build -erroraction silentlycontinue | out-null

# Setup ENV
$env:CGO_ENABLED=1

# Compile DLL for windows using mingw
go build --buildmode=c-shared --buildvcs=false --ldflags="-s -w" `
    -o "build/goDLL.dll" --tags=dll --trimpath .
