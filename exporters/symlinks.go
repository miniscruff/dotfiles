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

	e.writer.Write([]byte("#! /bin/bash\n"))
	e.writer.Write([]byte("set -exu\n\n"))
	e.writer.Write([]byte("DOTFILES=$HOME/projects/miniscruff/dotfiles\n\n"))

	// include the apps directory
	e.writer.Write([]byte("mkdir -p $HOME/apps\n"))

	// first walk the path to find all directories
	filepath.Walk("settings", func(path string, info fs.FileInfo, err error) error {
		if !info.IsDir() {
			return nil
		}

		if path == "settings" {
			return nil
		}

		realPath := strings.Replace(path, "settings", "$HOME", 1)
		e.writer.Write([]byte(fmt.Sprintf("mkdir -p %v\n", realPath)))
		return nil
	})
	e.writer.Write([]byte(fmt.Sprintf("\n")))

	// then walk to find all files
	filepath.Walk("settings", func(path string, info fs.FileInfo, err error) error {
		if info.IsDir() {
			return nil
		}

		trimmedPath := strings.TrimPrefix(path, "settings/")
		e.writer.Write([]byte(fmt.Sprintf(
			"ln -f $DOTFILES/settings/%v $HOME/%v\n",
			trimmedPath,
			trimmedPath,
		)))
		return nil
	})
	e.writer.Write([]byte(fmt.Sprintf("\n")))

	return nil
}
