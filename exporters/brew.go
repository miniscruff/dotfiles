package exporters

import (
	"io"
	"sort"
	"strings"

	"github.com/miniscruff/dotfiles/tool"
)

type BrewExporter struct {
	writer io.WriteCloser
}

func NewBrewExporter(w io.WriteCloser) *BrewExporter {
	return &BrewExporter{
		writer: w,
	}
}

func (e *BrewExporter) Export(tools []tool.Tool) error {
	defer e.writer.Close()

	_, _ = e.writer.Write([]byte("#! /bin/zsh\n"))
	_, _ = e.writer.Write([]byte("set -exu\n\n"))
	_, _ = e.writer.Write([]byte("brew install \\\n    "))

	allBrews := make(map[string]struct{})

	for _, t := range tools {
		for _, brew := range t.Brews {
			allBrews[brew] = struct{}{}
		}
	}

	var sortedAndUniqueBrews []string
	for brew := range allBrews {
		sortedAndUniqueBrews = append(sortedAndUniqueBrews, brew)
	}

	sort.Strings(sortedAndUniqueBrews)

	_, _ = e.writer.Write([]byte(strings.Join(sortedAndUniqueBrews, " \\\n    ")))

	return nil
}
