package exporters

import (
	"fmt"
	"io"
	"io/fs"
	"path/filepath"
	"strings"

	"github.com/miniscruff/dotfiles/tool"
)

type SymlinksExporter struct {
	writer io.WriteCloser
}

func NewSymlinkExporter(w io.WriteCloser) *SymlinksExporter {
	return &SymlinksExporter{
		writer: w,
	}
}

func (e *SymlinksExporter) Export(_ []tool.Tool) error {
	defer e.writer.Close()

	_, _ = e.writer.Write([]byte("#! /bin/bash\n"))
	_, _ = e.writer.Write([]byte("set -exu\n\n"))
	_, _ = e.writer.Write([]byte("DOTFILES=$HOME/projects/miniscruff/dotfiles\n\n"))

	// include the apps directory
	_, _ = e.writer.Write([]byte("mkdir -p $HOME/apps\n"))

	// first walk the path to find all directories
	_ = filepath.Walk("settings", func(path string, info fs.FileInfo, err error) error {
		if !info.IsDir() {
			return nil
		}

		if path == "settings" {
			return nil
		}

		realPath := strings.Replace(path, "settings", "$HOME", 1)
		_, _ = e.writer.Write([]byte(fmt.Sprintf("mkdir -p %v\n", realPath)))
		return nil
	})

	_, _ = e.writer.Write([]byte("\n"))

	// then walk to find all files
	_ = filepath.Walk("settings", func(path string, info fs.FileInfo, err error) error {
		if info.IsDir() {
			return nil
		}

		trimmedPath := strings.TrimPrefix(path, "settings/")
		_, _ = e.writer.Write([]byte(fmt.Sprintf(
			"ln -f $DOTFILES/settings/%v $HOME/%v\n",
			trimmedPath,
			trimmedPath,
		)))

		return nil
	})

	_, _ = e.writer.Write([]byte("\n"))

	return nil
}
