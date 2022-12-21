#! /bin/bash
set -exu

DOTFILES=$HOME/projects/miniscruff/dotfiles

mkdir $HOME/.config
mkdir $HOME/.config/alacritty
mkdir $HOME/.config/fontconfig
mkdir $HOME/.config/gh-dash
mkdir $HOME/.config/i3
mkdir $HOME/.config/i3blocks
mkdir $HOME/.config/nixpkgs
mkdir $HOME/.config/nvim
mkdir $HOME/.config/nvim/lua
mkdir $HOME/.config/qmk
mkdir $HOME/.config/ranger
mkdir $HOME/.config/rofi
mkdir $HOME/.local
mkdir $HOME/.local/bin

ln -f $HOME/.config/alacritty/alacritty.yml $DOTFILES/settings/.config/alacritty/alacritty.yml
ln -f $HOME/.config/fontconfig/fonts.conf $DOTFILES/settings/.config/fontconfig/fonts.conf
ln -f $HOME/.config/gh-dash/config.yml $DOTFILES/settings/.config/gh-dash/config.yml
ln -f $HOME/.config/i3/config $DOTFILES/settings/.config/i3/config
ln -f $HOME/.config/i3blocks/config $DOTFILES/settings/.config/i3blocks/config
ln -f $HOME/.config/nixpkgs/config.nix $DOTFILES/settings/.config/nixpkgs/config.nix
ln -f $HOME/.config/nvim/init.vim $DOTFILES/settings/.config/nvim/init.vim
ln -f $HOME/.config/qmk/qmk.ini $DOTFILES/settings/.config/qmk/qmk.ini
ln -f $HOME/.config/ranger/rc.conf $DOTFILES/settings/.config/ranger/rc.conf
ln -f $HOME/.config/rofi/config.rasi $DOTFILES/settings/.config/rofi/config.rasi
ln -f $HOME/.gitconfig $DOTFILES/settings/.gitconfig
ln -f $HOME/.gitignore $DOTFILES/settings/.gitignore
ln -f $HOME/.local/bin/audio.sh $DOTFILES/settings/.local/bin/audio.sh
ln -f $HOME/.local/bin/music-bar.sh $DOTFILES/settings/.local/bin/music-bar.sh
ln -f $HOME/.local/bin/projects.sh $DOTFILES/settings/.local/bin/projects.sh
ln -f $HOME/.local/bin/upgrade.sh $DOTFILES/settings/.local/bin/upgrade.sh
ln -f $HOME/.zshenv $DOTFILES/settings/.zshenv
ln -f $HOME/.zshrc $DOTFILES/settings/.zshrc

