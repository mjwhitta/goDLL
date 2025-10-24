all: build

build: fmt
ifeq ($(OS),Windows_NT)
	@powershell ../tools/win/build.ps1
else
	@../tools/lin/build.sh
endif

clean:
ifeq ($(OS),Windows_NT)
ifneq ($(wildcard build),)
	@powershell -c "remove-item -force -recurse build"
endif
else
	@rm -f -r build build
endif

fmt:
	@go fmt .
