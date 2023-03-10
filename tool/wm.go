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
}
