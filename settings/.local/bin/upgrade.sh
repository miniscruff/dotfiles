#! /bin/zsh
set -exu

sudo apt update
sudo apt upgrade -y
$DOTFILES/install/apt.sh
$DOTFILES/install/apps.sh
$DOTFILES/install/git-packages.sh
$DOTFILES/install/symlinks.sh
sudo apt autoremove -y

brew upgrade
omz update

