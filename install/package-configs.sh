#! /bin/sh

set -exu

curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
export NVM_HOME="$HOME/.nvm"
chmod +x $HOME/.nvm/nvm.sh
. $HOME/.nvm/nvm.sh
nvm install node
chsh -s $(which zsh)
wget -O go.tar.gz https://dl.google.com/go/go1.17.12.linux-amd64.tar.gz
tar -C ${HOME}/.local/bin -xvf go.tar.gz
rm -f go.tar.gz
python3 -m pip install --upgrade pip