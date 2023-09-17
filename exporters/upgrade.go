package exporters

import (
	"fmt"
	"io"

	"github.com/miniscruff/dotfiles/tool"
)

type UpgradeExporter struct {
	writer io.WriteCloser
}

func NewUpgradeExporter(w io.WriteCloser) *UpgradeExporter {
	return &UpgradeExporter{
		writer: w,
	}
}

func (e *UpgradeExporter) Export(tools []tool.Tool) error {
	defer e.writer.Close()

	e.writer.Write([]byte("#! /bin/zsh\n"))
	e.writer.Write([]byte("set -exu\n\n"))
	e.writer.Write([]byte("sudo apt update\n"))
	e.writer.Write([]byte("sudo apt upgrade -y\n"))
	e.writer.Write([]byte("sudo apt autoremove -y\n"))
	e.writer.Write([]byte("$DOTFILES/install/apt.sh\n"))
	e.writer.Write([]byte("$DOTFILES/install/apps.sh\n"))
	e.writer.Write([]byte("$DOTFILES/install/git-packages.sh\n\n"))
	e.writer.Write([]byte("$DOTFILES/install/symlinks.sh\n\n"))

	// update all our git repos as some are tools
	for _, t := range tools {
		for _, gh := range t.GitHub {
			e.writer.Write([]byte(fmt.Sprintf(
				"git -C $HOME/projects/%v/%v pull\n",
				gh.Owner,
				gh.Repo,
			)))
		}
	}
	e.writer.Write([]byte("\n"))

	for _, t := range tools {
		for _, ul := range t.Upgrades {
			e.writer.Write([]byte(ul + "\n"))
		}

		if len(t.Upgrades) > 0 {
			e.writer.Write([]byte("\n"))
		}
	}

	return nil
}
