package main

import (
	"fmt"
	"os"

	"github.com/urfave/cli"
)

func main() {
	app := cli.NewApp()
	app.Name = "goenv"
	app.Usage = "isolated go environments"

	app.Commands = []cli.Command{
		{
			Name:   "new",
			Usage:  "Create a new project goenv.",
			Action: New,
		},
		{
			Name:   "open",
			Usage:  "Open the project in the preferred editor.",
			Action: Open,
		},
		{
			Name:   "act",
			Usage:  "Activate the project goenv.",
			Action: Activate,
		},
		{
			Name:   "rm",
			Usage:  "Delete the project goenv.",
			Action: Delete,
		},
	}

	app.Run(os.Args)
}

var New = func(c *cli.Context) error {
	fmt.Println("Creating new project goenv: ", c.Args().First())
	return nil
}

var Activate = func(c *cli.Context) error {
	fmt.Println("Activating project goenv: ", c.Args().First())
	return nil
}

var Open = func(c *cli.Context) error {
	fmt.Println("Opening the project in preferred editor: ", c.Args().First())
	return nil
}

var Delete = func(c *cli.Context) error {
	fmt.Println("Deleting the project goenv: ", c.Args().First())
	return nil
}
