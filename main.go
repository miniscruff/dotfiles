package main

import (
	"fmt"
	"io"
	"io/fs"
	"log"
	"os"
	"path/filepath"
	"strings"
	"text/template"
)

const nixTmpl = `# Autogenerated by Dotfiles
{
  packageOverrides = pkgs: with pkgs; {
    defaultSystem = pkgs.buildEnv {
      name = "default";
      paths = [
        {{- range . }}
        {{.}}
        {{- end }}
      ];
    };
  };
}`

const ghTmpl = `
if [ ! -d "~/{{.Owner}}/{{.Repo}}" ] ; then
    gh repo clone {{.Owner}}/{{.Repo}} -- ~/projects/{{.Owner}}/{{.Repo}}
fi
`

type Tool struct {
	NixPackages []string
	GitHub      []GitHub
}

type GitHub struct {
	Owner string
	Repo  string
}

func GenNix(writer io.Writer, tools []Tool) error {
	nixTemplate, err := template.New("nix").Parse(nixTmpl)
	if err != nil {
		return err
	}

	pkgs := []string{}
	for _, t := range tools {
		for _, pkg := range t.NixPackages {
			pkgs = append(pkgs, pkg)
		}
	}

	return nixTemplate.Execute(writer, pkgs)
}

func GenGitHub(writer io.Writer, tools []Tool) error {
	writer.Write([]byte("#! /bin/bash\n"))
	writer.Write([]byte("set -exu\n"))

	ghTemplate, err := template.New("github").Parse(ghTmpl)
	if err != nil {
		return err
	}

	for _, t := range tools {
		for _, gh := range t.GitHub {
			err := ghTemplate.Execute(writer, gh)
			if err != nil {
				return err
			}
		}
	}

	return nil
}

func GenSymlinks(writer io.Writer) error {
	writer.Write([]byte("#! /bin/bash\n"))
	writer.Write([]byte("set -exu\n\n"))
	writer.Write([]byte("DOTFILES=$HOME/projects/miniscruff/dotfiles\n\n"))

	// first walk the path to find all directories
	filepath.Walk("settings", func(path string, info fs.FileInfo, err error) error {
		if !info.IsDir() {
			return nil
		}

		if path == "settings" {
			return nil
		}

		realPath := strings.Replace(path, "settings", "$HOME", 1)
		writer.Write([]byte(fmt.Sprintf("mkdir %v\n", realPath)))
		return nil
	})
	writer.Write([]byte(fmt.Sprintf("\n")))

	// then walk to find all files
	filepath.Walk("settings", func(path string, info fs.FileInfo, err error) error {
		if info.IsDir() {
			return nil
		}

		trimmedPath := strings.TrimPrefix(path, "settings/")
		writer.Write([]byte(fmt.Sprintf(
			"ln -f $HOME/%v $DOTFILES/settings/%v\n",
			trimmedPath,
			trimmedPath,
		)))
		return nil
	})
	writer.Write([]byte(fmt.Sprintf("\n")))

	return nil
}

func main() {
	tools := []Tool{
		{
			NixPackages: []string{"alacritty"},
			GitHub: []GitHub{
				{
					Owner: "catpucchin",
					Repo:  "alacritty",
				},
			},
		},
		{
			NixPackages: []string{
				"i3-gaps",
				"i3-lock",
				"i3status",
				"i3blocks",
				"rofi",
				"feh",
				"ranger",
				"highlight",
				"atool",
			},
			GitHub: []GitHub{
				{
					Owner: "vivien",
					Repo:  "i3blocks-contrib",
				},
			},
		},
		{
			NixPackages: []string{"neovim"},
		},
		{
			NixPackages: []string{"zsh", "oh-my-zsh"},
		},
		{
			NixPackages: []string{"gh"},
			GitHub: []GitHub{
				{Owner: "miniscruff", Repo: "changie"},
				{Owner: "miniscruff", Repo: "changie-action"},
				{Owner: "miniscruff", Repo: "genenv"},
			},
		},
	}

	nixFile, err := os.Create("settings/.config/nixpkgs/config.nix")
	if err != nil {
		log.Fatal(err)
	}
	defer nixFile.Close()

	if err := GenNix(nixFile, tools); err != nil {
		log.Fatal(err)
	}

	gitFile, err := os.Create("install/git-packages.sh")
	if err != nil {
		log.Fatal(err)
	}
	defer gitFile.Close()

	if err := GenGitHub(gitFile, tools); err != nil {
		log.Fatal(err)
	}

	symFile, err := os.Create("install/symlinks.sh")
	if err != nil {
		log.Fatal(err)
	}
	defer symFile.Close()

	if err := GenSymlinks(symFile); err != nil {
		log.Fatal(err)
	}
}