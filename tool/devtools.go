package tool

var devtools Tool = Tool{
    // manually install ghostty as well
	Brews: []string{
		"gh",
		"jq",
		"gum",
		"bat",
		"go",
        "zellij",
        "neovim",
	},
	Upgrades: []string{
		"brew upgrade",
		"omz update",
	},
}
