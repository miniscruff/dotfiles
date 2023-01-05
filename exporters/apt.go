package exporters

import (
	"io"
	"sort"
	"strings"

	"github.com/miniscruff/dotfiles/tool"
)

type AptExporter struct {
	writer io.WriteCloser
}

func NewAptExporter(w io.WriteCloser) *AptExporter {
    return &AptExporter{
        writer: w,
    }
}

func (e *AptExporter) Export(tools []tool.Tool) error {
	defer e.writer.Close()

	e.writer.Write([]byte("#! /bin/zsh\n"))
	e.writer.Write([]byte("set -exu\n\n"))
	e.writer.Write([]byte("sudo apt install -y \\\n    "))

    allApts := make(map[string]struct{})

	for _, t := range tools {
        for _, apt := range t.AptPackages {
            allApts[apt] = struct{}{}
        }
    }

    var sortedAndUniqueApts []string
    for apt := range allApts {
        sortedAndUniqueApts = append(sortedAndUniqueApts, apt)
    }
    sort.Strings(sortedAndUniqueApts)

    e.writer.Write([]byte(strings.Join(sortedAndUniqueApts, " \\\n    ")))

	return nil
}
