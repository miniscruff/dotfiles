package exporters

import (
	"fmt"
	"io"

	"github.com/miniscruff/dotfiles/tool"
)

type AliasExporter struct {
	writer io.WriteCloser
}

func NewAliasExporter(w io.WriteCloser) *AliasExporter {
	return &AliasExporter{
		writer: w,
	}
}

func (e *AliasExporter) Export(tools []tool.Tool) error {
	defer e.writer.Close()

	_, _ = e.writer.Write([]byte("#! /bin/zsh\n\n"))

	for _, t := range tools {
		for _, al := range t.Aliases {
			_, _ = e.writer.Write([]byte(fmt.Sprintf("alias -g %v\n", al)))
		}
	}

	return nil
}
