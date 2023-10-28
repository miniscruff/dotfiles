#! /bin/sh
set -exu

echo Updating system
sudo apt upgrade -y
sudo apt update
sudo apt install -y curl make

echo Installing packages
./install/apt.sh

echo Setting zsh as default shell
sudo chsh -s $(which zsh)

echo Installing apps
./install/apps.sh

echo Login to GitHub
gh auth login
gh auth setup-git

echo Installing GitHub Repos
./install/git-packages.sh

echo Running upgrade
./settings/.local/bin/upgrade.sh

echo Symlinking Configs
./install/symlinks.sh

echo Cleaning up
sudo apt auto-remove -y

echo Complete
