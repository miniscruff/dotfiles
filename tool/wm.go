package tool

var wm Tool = Tool{
	AptPackages: []string{
		"i3lock",
		"i3status",
		"i3blocks",
		"rofi",
		"feh",
		"ranger",
		"highlight",
		"atool",
		"jq",
	},
	GitHub: []GitHub{
		{
			Owner: "vivien",
			Repo:  "i3blocks-contrib",
		},
	},
	Apps: []App{
		{
			Name:          "gh",
			GetVersion:    "gh --version | head -n 1 | awk '{print $3}'",
			LatestVersion: "gh release -R cli/cli list --exclude-pre-releases --limit 1 | awk '{print $3}'",
			TarUrl:        "https://github.com/cli/cli/releases/download/v${GH_LATEST}",
			TarFile:       "gh_${GH_LATEST}_linux_amd64.tar.gz",
			PostTar:       "mv gh_${GH_LATEST}_linux_amd64/bin/gh $BIN_DIR && rm -rf gh_${GH_LATEST}_linux_amd64",
		},
	},
    Upgrades: []string{
        "gh extensions upgrade --all",
    },
}
