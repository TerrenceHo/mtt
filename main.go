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
		fmt.Println(Version)
		fmt.Println(BuildTime)
		fmt.Println(GitHash)
		os.Exit(0)
	}

	fmt.Println("Build Successful")
}
