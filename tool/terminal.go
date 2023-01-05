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
            Owner: "rust-lang",
            Repo: "rustup",
        },
        {
            Owner: "ohmyzsh",
            Repo: "ohmyzsh",
        },
		{
			Owner: "alacritty",
			Repo:  "alacritty",
		},
	},
    Upgrades: []string{
        "pushd $HOME/projects/rust-lang/rustup",
        "./rustup-init.sh --no-modify-path --profile default -y",
        "popd",
        "pushd $HOME/projects/alacritty/alacritty",
        "cargo build --release",
        "sudo tic -xe alacritty,alacritty-direct extra/alacritty.info",
        "cp target/release/alacritty $BIN_DIR/",
        "popd",
    },
}
