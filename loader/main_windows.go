//go:build windows

package main

import (
	"flag"
	"time"

	"golang.org/x/sys/windows"
)

func init() {
	flag.Parse()
}

func main() {
	var dll string = "./goDLL.dll"

	if flag.NArg() > 0 {
		dll = flag.Arg(0)
	}

	// https://github.com/golang/go/issues/75949
	//
	// Based on testing for the above GitHub issue, it appears that
	// DLLs built by Go v1.25+ will block, if the calling function
	// does not give LoadLibrary() enough time to initialize the DLL.
	//
	// This means:
	//
	//   windows LoadLibarary(...)
	//   fmt.Scanln()
	//
	// is bad! You can add a time.Sleep() between. I've tested with as
	// little as time.Millisecond, but this may lead to a race
	// condition.
	if _, e := windows.LoadLibrary(dll); e != nil {
		println(e.Error())
	}

	println("Press ^C to exit")
	for {
		time.Sleep(time.Hour)
	}
}
