#! /bin/sh
set -exu

echo Updating system
sudo apt upgrade -y
sudo apt update
sudo apt install -y curl make

echo Installing Nix
sh <(curl -L https://nixos.org/nix/install) --daemon

echo Installing GH
nix-env -iA nixpkgs.gh

echo Login to GitHub
gh auth login
gh auth setup-git

echo Installing GitHub Repos
./install/git-packages.sh

echo Symlinking Configs
./install/symlinks.sh

echo Installing nix packages
nix-channel --update
nix-env -iA nixpkgs.nix nixpkgs.cacert
nix-env -iA nixpkgs.defaultSystem

echo Installing youtube music
sudo snap install youtube-music-desktop-app

echo Cleaning up
sudo apt auto-remove -y

echo Complete
