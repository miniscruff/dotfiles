package exporters

import (
	"io"
	"strings"
	"text/template"

	"github.com/miniscruff/dotfiles/tool"
)

const appTmpl = `
{{- $NameUpper := .Name | ToUpper }}
{{$NameUpper}}_VERSION="0.0.0"
if [ -f "{{$NameUpper}}_VERSION" ] ; then
    {{$NameUpper}}_VERSION=$(cat {{$NameUpper}}_VERSION)
fi
{{$NameUpper}}_LATEST=$({{.LatestVersion}})
if [ "${{$NameUpper}}_VERSION" != ${{$NameUpper}}_LATEST ] ; then
   {{- if .PreTar }}
   {{.PreTar}}
   {{- end }}
   wget {{.TarUrl}}/{{.TarFile}}
   tar -xf {{.TarFile}}
   rm {{.TarFile}}
   {{- if .PostTar }}
   {{.PostTar}}
   {{- end }}
   echo ${{$NameUpper}}_LATEST > {{$NameUpper}}_VERSION
fi
`

type AppExporter struct {
	writer io.WriteCloser
}

func NewAppExporter(w io.WriteCloser) *AppExporter {
	return &AppExporter{
		writer: w,
	}
}

func (e *AppExporter) Export(tools []tool.Tool) error {
	defer e.writer.Close()

	_, _ = e.writer.Write([]byte("#! /bin/bash\n"))
	_, _ = e.writer.Write([]byte("set -exu\n"))
	_, _ = e.writer.Write([]byte("BIN_DIR=$HOME/.local/bin\n"))
	_, _ = e.writer.Write([]byte("cd $HOME/apps\n"))

	funcMap := template.FuncMap{
		"ToUpper": strings.ToUpper,
	}

	appTemplate, err := template.New("app").Funcs(funcMap).Parse(appTmpl)
	if err != nil {
		return err
	}

	for _, t := range tools {
		for _, app := range t.Apps {
			err := appTemplate.Execute(e.writer, app)
			if err != nil {
				return err
			}
		}
	}

	_, _ = e.writer.Write([]byte("\ncd $HOME/projects/miniscruff/dotfiles\n"))

	return nil
}
