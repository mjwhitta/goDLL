# Compile DLL for windows using mingw
mkdir build -erroraction silentlycontinue | out-null
go build --buildvcs=false --ldflags="-s -w" -o build/loader.exe `
    --trimpath ./loader
