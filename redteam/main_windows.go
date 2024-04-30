//go:build windows

package main

import "github.com/mjwhitta/win/dbg"

var bin string = "exe"

func main() {
	// TODO Do stuff here
	dbg.Printf("It works! (%s)", bin)
}
