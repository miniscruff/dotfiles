package main

import (
	"log"

	"github.com/miniscruff/dotfiles/exporters"
	"github.com/miniscruff/dotfiles/tool"
)

func main() {
	tools, err := tool.AllTools()
	if err != nil {
		log.Fatal("loading tools:", err)
	}

	exps, err := exporters.AllExporters()
	if err != nil {
		log.Fatal("loading exporters:", err)
	}

	for _, export := range exps {
        err = export.Export(tools)
        if err != nil {
            log.Fatal("error exporting:", err)
        }
	}
}
