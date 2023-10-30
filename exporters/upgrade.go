package exporters

import (
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

	_, _ = e.writer.Write([]byte("#! /bin/zsh\n"))
	_, _ = e.writer.Write([]byte("set -exu\n\n"))
	_, _ = e.writer.Write([]byte("sudo apt update\n"))
	_, _ = e.writer.Write([]byte("sudo apt upgrade -y\n"))
	_, _ = e.writer.Write([]byte("$DOTFILES/install/apt.sh\n"))
	_, _ = e.writer.Write([]byte("$DOTFILES/install/apps.sh\n"))
	_, _ = e.writer.Write([]byte("$DOTFILES/install/git-packages.sh\n"))
	_, _ = e.writer.Write([]byte("$DOTFILES/install/symlinks.sh\n"))
	_, _ = e.writer.Write([]byte("sudo apt autoremove -y\n\n"))

	for _, t := range tools {
		for _, ul := range t.Upgrades {
			_, _ = e.writer.Write([]byte(ul + "\n"))
		}

		if len(t.Upgrades) > 0 {
			_, _ = e.writer.Write([]byte("\n"))
		}
	}

	return nil
}
