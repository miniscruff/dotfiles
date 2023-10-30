package tool

var terminal Tool = Tool{
	AptPackages: []string{
		"zsh",
		"cmake",
		"pkg-config",
		"libfreetype6-dev",
		"libfontconfig1-dev",
		"libxcb-xfixes0-dev",
		"libxkbcommon-dev",
		"python3",
	},
	GitHub: []GitHub{
		{
			Owner: "catppuccin",
			Repo:  "alacritty",
		},
		{
			Owner: "ohmyzsh",
			Repo:  "ohmyzsh",
		},
	},
	Brews: []string{
		"alacritty",
	},
}
