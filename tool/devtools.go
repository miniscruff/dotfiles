package tool

var devtools Tool = Tool{
	// manually install neovim for now...
	Brews: []string{
		"gh",
		"jq",
		"gum",
		"bat",
		"go",
	},
	Upgrades: []string{
		"brew upgrade",
		"omz update",
	},
}
