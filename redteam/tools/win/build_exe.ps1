# Compile DLL for windows using mingw
mkdir build -erroraction silentlycontinue | out-null
go build --buildvcs=false --ldflags="-H=windowsgui -s -w" `
    -o "build/goDLL.exe" --trimpath .
