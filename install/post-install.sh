#! /bin/bash

set -exu

git config --global core.excludesfile ~/.gitignore
nvim --headless +PlugInstall +UpdateRemotePlugins +qa
pip3 install jedi neovim
sudo snap install youtube-music-desktop-app