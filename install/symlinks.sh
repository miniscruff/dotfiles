#! /bin/bash
set -exu

DOTFILES=$HOME/projects/miniscruff/dotfiles

mkdir -p $HOME/.config
mkdir -p $HOME/.config/alacritty
mkdir -p $HOME/.config/fontconfig
mkdir -p $HOME/.config/gh-dash
mkdir -p $HOME/.config/i3
mkdir -p $HOME/.config/i3blocks
mkdir -p $HOME/.config/nixpkgs
mkdir -p $HOME/.config/nvim
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
ln -f $DOTFILES/settings/.config/nixpkgs/config.nix $HOME/.config/nixpkgs/config.nix
ln -f $DOTFILES/settings/.config/nvim/init.vim $HOME/.config/nvim/init.vim
ln -f $DOTFILES/settings/.config/qmk/qmk.ini $HOME/.config/qmk/qmk.ini
ln -f $DOTFILES/settings/.config/ranger/rc.conf $HOME/.config/ranger/rc.conf
ln -f $DOTFILES/settings/.config/rofi/config.rasi $HOME/.config/rofi/config.rasi
ln -f $DOTFILES/settings/.gitconfig $HOME/.gitconfig
ln -f $DOTFILES/settings/.gitignore $HOME/.gitignore
ln -f $DOTFILES/settings/.local/bin/audio.sh $HOME/.local/bin/audio.sh
ln -f $DOTFILES/settings/.local/bin/music-bar.sh $HOME/.local/bin/music-bar.sh
ln -f $DOTFILES/settings/.local/bin/projects.sh $HOME/.local/bin/projects.sh
ln -f $DOTFILES/settings/.local/bin/upgrade.sh $HOME/.local/bin/upgrade.sh
ln -f $DOTFILES/settings/.zshenv $HOME/.zshenv
ln -f $DOTFILES/settings/.zshrc $HOME/.zshrc

