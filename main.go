package main

import (
	"flag"
	"fmt"
	"os"
)

var (
	BuildTime string
	Version   string
	GitHash   string
)

func main() {
	version := flag.Bool("v", false, "Prints version, buildtime, and git hash")
	flag.Parse()

	if *version {
		fmt.Println("mtt, version", Version)
		fmt.Println("Built at:", BuildTime)
		fmt.Println("Git hash for verification:", GitHash)
		os.Exit(0)
	}

	fmt.Println("Build Successful")
}
