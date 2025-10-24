//go:build dll && windows

package main

import "C"

// DllRegisterServer is an entry point called by regsvr32.exe.
//
//export DllRegisterServer
func DllRegisterServer() {
	bin = "dll"
	main()
}

// DllUnregisterServer is an entry point called by regsvr32.exe.
//
//export DllUnregisterServer
func DllUnregisterServer() {
	bin = "dll"
	main()
}

// Main is an entry point to call when using rundll32.exe.
//
//export Main
func Main() {
	bin = "dll"
	main()
}
