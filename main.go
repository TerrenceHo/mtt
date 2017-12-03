package main

import (
	"flag"
	"fmt"
	"io/ioutil"
	"os"
	"os/exec"
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

	vi := "vim"
	tmpDir := os.TempDir()
	tmpFile, tmpFileErr := ioutil.TempFile(tmpDir, "tempFilePrefix")
	if tmpFileErr != nil {
		fmt.Printf("Error %s while creating tempFile", tmpFileErr)
	}
	path, err := exec.LookPath(vi)
	if err != nil {
		fmt.Printf("Error %s while looking up for %s!!", path, vi)
	}
	fmt.Printf("%s is available at %s\nCalling it with file %s \n", vi, path, tmpFile.Name())

	cmd := exec.Command(path, tmpFile.Name())
	cmd.Stdin = os.Stdin
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	err = cmd.Start()
	if err != nil {
		fmt.Printf("Start failed: %s", err)
	}
	fmt.Printf("Waiting for command to finish.\n")
	err = cmd.Wait()
	if err != nil {
		fmt.Printf("Command finished with error: %v\n", err)
	} else {
		fmt.Println("Execution Successful")
	}

}
