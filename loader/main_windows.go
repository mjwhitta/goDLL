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

	if _, e := windows.LoadLibrary(dll); e != nil {
		println(e.Error())
	}

	println("Press ^C to exit")
	for {
		time.Sleep(time.Hour)
	}
}
