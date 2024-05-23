package main

import (
	"flag"
	"fmt"

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

	fmt.Println("Press enter to exit")
	fmt.Scanln()
}
