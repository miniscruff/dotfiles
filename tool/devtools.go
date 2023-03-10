package tool

var devtools Tool = Tool{
	Apps: []App{
		{
			Name:          "nvim",
			GetVersion:    "nvim --version | head -n 1 | awk '{print $2}'",
			LatestVersion: "gh release -R neovim/neovim list --exclude-pre-releases --limit 1 | awk '{print $2}'",
			TarUrl:        "https://github.com/neovim/neovim/releases/download/v${NVIM_LATEST}",
			TarFile:       "nvim-linux64.tar.gz",
			PreTar:        "rm -rf nvim-linux64",
			PostTar:       "",
		},
		{
			Name:          "gh",
			GetVersion:    "gh --version | head -n 1 | awk '{print $3}'",
			LatestVersion: "gh release -R cli/cli list --exclude-pre-releases --limit 1 | awk '{print $3}'",
			TarUrl:        "https://github.com/cli/cli/releases/download/v${GH_LATEST}",
			TarFile:       "gh_${GH_LATEST}_linux_amd64.tar.gz",
			PostTar:       "mv gh_${GH_LATEST}_linux_amd64/bin/gh $BIN_DIR && rm -rf gh_${GH_LATEST}_linux_amd64",
		},
		{
			Name:          "xc",
			GetVersion:    "xc --version | awk '{print $3}'",
			LatestVersion: "gh release -R joerdav/xc list --exclude-pre-releases --limit 1 | awk '{print $3}' | cut -c2-",
			TarUrl:        "https://github.com/joerdav/xc/releases/download/v${XC_LATEST}",
			TarFile:       "xc_${XC_LATEST}_linux_amd64.tar.gz",
			PostTar:       "mv xc $BIN_DIR && rm -rf xc",
		},
	},
    Upgrades: []string{
		"nvim --headless +UpdateRemotePlugins +qall",
		"nvim --headless +PackerSync +qall",
		"nvim --headless +PackerClean +qall",
        "gh extensions upgrade --all",
    },
	Aliases: []string{
		`nvim="$HOME/apps/nvim-linux64/bin/nvim"`,
	},
}
