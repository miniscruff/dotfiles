#! /bin/bash
set -exu

DOTFILES=$HOME/projects/miniscruff/dotfiles

mkdir -p $HOME/apps
mkdir -p $HOME/.config
mkdir -p $HOME/.config/alacritty
mkdir -p $HOME/.config/fontconfig
mkdir -p $HOME/.config/ghostty
mkdir -p $HOME/.config/i3
mkdir -p $HOME/.config/i3blocks
mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.config/nvim/after
mkdir -p $HOME/.config/nvim/after/ftplugin
mkdir -p $HOME/.config/nvim/lua
mkdir -p $HOME/.config/nvim/lua/config
mkdir -p $HOME/.config/nvim/lua/plugins
mkdir -p $HOME/.config/nvim/plugin
mkdir -p $HOME/.config/qmk
mkdir -p $HOME/.config/ranger
mkdir -p $HOME/.config/rofi
mkdir -p $HOME/.local
mkdir -p $HOME/.local/bin

ln -f $DOTFILES/settings/.config/alacritty/alacritty.toml $HOME/.config/alacritty/alacritty.toml
ln -f $DOTFILES/settings/.config/fontconfig/fonts.conf $HOME/.config/fontconfig/fonts.conf
ln -f $DOTFILES/settings/.config/ghostty/config $HOME/.config/ghostty/config
ln -f $DOTFILES/settings/.config/i3/config $HOME/.config/i3/config
ln -f $DOTFILES/settings/.config/i3blocks/config $HOME/.config/i3blocks/config
ln -f $DOTFILES/settings/.config/nvim/.gitignore $HOME/.config/nvim/.gitignore
ln -f $DOTFILES/settings/.config/nvim/after/ftplugin/css.lua $HOME/.config/nvim/after/ftplugin/css.lua
ln -f $DOTFILES/settings/.config/nvim/after/ftplugin/go.lua $HOME/.config/nvim/after/ftplugin/go.lua
ln -f $DOTFILES/settings/.config/nvim/after/ftplugin/html.lua $HOME/.config/nvim/after/ftplugin/html.lua
ln -f $DOTFILES/settings/.config/nvim/after/ftplugin/lua.lua $HOME/.config/nvim/after/ftplugin/lua.lua
ln -f $DOTFILES/settings/.config/nvim/init.lua $HOME/.config/nvim/init.lua
ln -f $DOTFILES/settings/.config/nvim/lua/config/lazy.lua $HOME/.config/nvim/lua/config/lazy.lua
ln -f $DOTFILES/settings/.config/nvim/lua/plugins/catppuccin.lua $HOME/.config/nvim/lua/plugins/catppuccin.lua
ln -f $DOTFILES/settings/.config/nvim/lua/plugins/completion.lua $HOME/.config/nvim/lua/plugins/completion.lua
ln -f $DOTFILES/settings/.config/nvim/lua/plugins/dadbod.lua $HOME/.config/nvim/lua/plugins/dadbod.lua
ln -f $DOTFILES/settings/.config/nvim/lua/plugins/lsp.lua $HOME/.config/nvim/lua/plugins/lsp.lua
ln -f $DOTFILES/settings/.config/nvim/lua/plugins/lualine.lua $HOME/.config/nvim/lua/plugins/lualine.lua
ln -f $DOTFILES/settings/.config/nvim/lua/plugins/neotest.lua $HOME/.config/nvim/lua/plugins/neotest.lua
ln -f $DOTFILES/settings/.config/nvim/lua/plugins/neotree.lua $HOME/.config/nvim/lua/plugins/neotree.lua
ln -f $DOTFILES/settings/.config/nvim/lua/plugins/telescope.lua $HOME/.config/nvim/lua/plugins/telescope.lua
ln -f $DOTFILES/settings/.config/nvim/lua/plugins/treesitter.lua $HOME/.config/nvim/lua/plugins/treesitter.lua
ln -f $DOTFILES/settings/.config/nvim/plugin/keymaps.lua $HOME/.config/nvim/plugin/keymaps.lua
ln -f $DOTFILES/settings/.config/nvim/plugin/options.lua $HOME/.config/nvim/plugin/options.lua
ln -f $DOTFILES/settings/.config/qmk/qmk.ini $HOME/.config/qmk/qmk.ini
ln -f $DOTFILES/settings/.config/ranger/rc.conf $HOME/.config/ranger/rc.conf
ln -f $DOTFILES/settings/.config/rofi/catppuccin-mocha.rasi $HOME/.config/rofi/catppuccin-mocha.rasi
ln -f $DOTFILES/settings/.config/rofi/config.rasi $HOME/.config/rofi/config.rasi
ln -f $DOTFILES/settings/.gitconfig $HOME/.gitconfig
ln -f $DOTFILES/settings/.local/bin/audio.sh $HOME/.local/bin/audio.sh
ln -f $DOTFILES/settings/.local/bin/music-bar.sh $HOME/.local/bin/music-bar.sh
ln -f $DOTFILES/settings/.local/bin/projects.sh $HOME/.local/bin/projects.sh
ln -f $DOTFILES/settings/.local/bin/solaar.sh $HOME/.local/bin/solaar.sh
ln -f $DOTFILES/settings/.local/bin/upgrade.sh $HOME/.local/bin/upgrade.sh
ln -f $DOTFILES/settings/.zshenv $HOME/.zshenv
ln -f $DOTFILES/settings/.zshrc $HOME/.zshrc

