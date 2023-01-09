#! /bin/bash
set -exu

DOTFILES=$HOME/projects/miniscruff/dotfiles

mkdir -p $HOME/apps
mkdir -p $HOME/.config
mkdir -p $HOME/.config/alacritty
mkdir -p $HOME/.config/fontconfig
mkdir -p $HOME/.config/gh-dash
mkdir -p $HOME/.config/i3
mkdir -p $HOME/.config/i3blocks
mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.config/nvim/after
mkdir -p $HOME/.config/nvim/after/plugin
mkdir -p $HOME/.config/nvim/lua
mkdir -p $HOME/.config/qmk
mkdir -p $HOME/.config/ranger
mkdir -p $HOME/.config/rofi
mkdir -p $HOME/.local
mkdir -p $HOME/.local/bin

ln -f $DOTFILES/settings/.config/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml
ln -f $DOTFILES/settings/.config/fontconfig/fonts.conf $HOME/.config/fontconfig/fonts.conf
ln -f $DOTFILES/settings/.config/gh-dash/config.yml $HOME/.config/gh-dash/config.yml
ln -f $DOTFILES/settings/.config/i3/config $HOME/.config/i3/config
ln -f $DOTFILES/settings/.config/i3blocks/config $HOME/.config/i3blocks/config
ln -f $DOTFILES/settings/.config/nvim/after/plugin/colors.lua $HOME/.config/nvim/after/plugin/colors.lua
ln -f $DOTFILES/settings/.config/nvim/after/plugin/line.lua $HOME/.config/nvim/after/plugin/line.lua
ln -f $DOTFILES/settings/.config/nvim/after/plugin/lsp.lua $HOME/.config/nvim/after/plugin/lsp.lua
ln -f $DOTFILES/settings/.config/nvim/after/plugin/neotest.lua $HOME/.config/nvim/after/plugin/neotest.lua
ln -f $DOTFILES/settings/.config/nvim/after/plugin/snippets.lua $HOME/.config/nvim/after/plugin/snippets.lua
ln -f $DOTFILES/settings/.config/nvim/after/plugin/telescope.lua $HOME/.config/nvim/after/plugin/telescope.lua
ln -f $DOTFILES/settings/.config/nvim/after/plugin/term.lua $HOME/.config/nvim/after/plugin/term.lua
ln -f $DOTFILES/settings/.config/nvim/after/plugin/tree.lua $HOME/.config/nvim/after/plugin/tree.lua
ln -f $DOTFILES/settings/.config/nvim/after/plugin/treesitter.lua $HOME/.config/nvim/after/plugin/treesitter.lua
ln -f $DOTFILES/settings/.config/nvim/init.lua $HOME/.config/nvim/init.lua
ln -f $DOTFILES/settings/.config/nvim/lua/remap.lua $HOME/.config/nvim/lua/remap.lua
ln -f $DOTFILES/settings/.config/nvim/lua/set.lua $HOME/.config/nvim/lua/set.lua
ln -f $DOTFILES/settings/.config/qmk/qmk.ini $HOME/.config/qmk/qmk.ini
ln -f $DOTFILES/settings/.config/ranger/rc.conf $HOME/.config/ranger/rc.conf
ln -f $DOTFILES/settings/.config/rofi/catppuccin-mocha.rasi $HOME/.config/rofi/catppuccin-mocha.rasi
ln -f $DOTFILES/settings/.config/rofi/config.rasi $HOME/.config/rofi/config.rasi
ln -f $DOTFILES/settings/.gitconfig $HOME/.gitconfig
ln -f $DOTFILES/settings/.gitignore $HOME/.gitignore
ln -f $DOTFILES/settings/.local/bin/audio.sh $HOME/.local/bin/audio.sh
ln -f $DOTFILES/settings/.local/bin/music-bar.sh $HOME/.local/bin/music-bar.sh
ln -f $DOTFILES/settings/.local/bin/projects.sh $HOME/.local/bin/projects.sh
ln -f $DOTFILES/settings/.local/bin/upgrade.sh $HOME/.local/bin/upgrade.sh
ln -f $DOTFILES/settings/.zshaliases $HOME/.zshaliases
ln -f $DOTFILES/settings/.zshenv $HOME/.zshenv
ln -f $DOTFILES/settings/.zshrc $HOME/.zshrc

