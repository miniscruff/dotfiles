package tool

var editor Tool = Tool{
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
	},
	Upgrades: []string{
		"nvim --headless +UpdateRemotePlugins +qall",
		"nvim --headless +PackerSync +qall",
		"nvim --headless +PackerClean +qall",
	},
	Aliases: []string{
		`nvim="$HOME/apps/nvim-linux64/bin/nvim"`,
	},
}
