package exporters

import (
	"io"
	"text/template"

	"github.com/miniscruff/dotfiles/tool"
)

const ghTmpl = `
if [ ! -d "$HOME/projects/{{.Owner}}/{{.Repo}}" ] ; then
    gh repo clone {{.Owner}}/{{.Repo}} -- $HOME/projects/{{.Owner}}/{{.Repo}}
fi
`

type GitHubExporter struct {
	writer io.WriteCloser
}

func NewGitHubExporter(w io.WriteCloser) *GitHubExporter {
	return &GitHubExporter{
		writer: w,
	}
}

func (e *GitHubExporter) Export(tools []tool.Tool) error {
	defer e.writer.Close()

	_, _ = e.writer.Write([]byte("#! /bin/bash\n"))
	_, _ = e.writer.Write([]byte("set -exu\n"))

	ghTemplate, err := template.New("github").Parse(ghTmpl)
	if err != nil {
		return err
	}

	for _, t := range tools {
		for _, gh := range t.GitHub {
			err := ghTemplate.Execute(e.writer, gh)
			if err != nil {
				return err
			}
		}
	}

	return nil
}
