export CC := x86_64-w64-mingw32-gcc
export CGO_ENABLED := 1
export GOARCH := amd64
export GOOS := windows

all: build

build: fmt dir
	@go build --buildvcs=false --ldflags="-H=windowsgui -s -w" -o build/goDLL.exe --trimpath .
	@go build --buildvcs=false --ldflags="-s -w" -o build/loader.exe --trimpath ./loader
	@go build --buildmode=c-shared --buildvcs=false --ldflags="-s -w" -o build/goDLL.dll --tags=dll --trimpath .

# OS specific
ifeq ($(OS),Windows_NT)
clean:
ifneq ($(wildcard build),)
	@powershell -c "remove-item -force -recurse build"
endif

dir:
ifeq ($(wildcard build),)
	@powershell -c "new-item -itemtype directory build | out-null"
endif
else
clean:
	@rm -f -r build

dir:
	@mkdir -p build
endif

fmt:
	@go fmt .
