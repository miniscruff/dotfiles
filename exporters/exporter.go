package exporters

import (
	"os"

	"github.com/miniscruff/dotfiles/tool"
)

type Exporter interface {
	Export([]tool.Tool) error
}

func AllExporters() ([]Exporter, error) {
	githubWriter, err := os.Create("install/git-packages.sh")
	if err != nil {
		return nil, err
	}

	symlinkWriter, err := os.Create("install/symlinks.sh")
	if err != nil {
		return nil, err
	}

	appWriter, err := os.Create("install/apps.sh")
	if err != nil {
		return nil, err
	}

	upgradeWriter, err := os.Create("settings/.local/bin/upgrade.sh")
	if err != nil {
		return nil, err
	}

	aliasWriter, err := os.Create("settings/.zshaliases")
	if err != nil {
		return nil, err
	}

	aptWriter, err := os.Create("install/apt.sh")
	if err != nil {
		return nil, err
	}

	return []Exporter{
		NewAptExporter(aptWriter),
		NewGitHubExporter(githubWriter),
		NewUpgradeExporter(upgradeWriter),
		NewAliasExporter(aliasWriter),
		NewAppExporter(appWriter),
		// symlinks should come last after any file gen
		NewSymlinkExporter(symlinkWriter),
	}, nil
}
