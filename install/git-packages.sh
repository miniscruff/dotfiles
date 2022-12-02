#! /bin/bash

set -exu

mkdir -p packages
cd packages

if [ ! -d "qmk_firmware" ] ; then
  git clone https://github.com/miniscruff/qmk_firmware
fi

if [ ! -d "alacritty" ] ; then
  git clone https://github.com/alacritty/alacritty.git
  cd alacritty
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  source ~/.cargo/env
  rustup override set stable
  rustup update stable
  cargo build --release
  sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
  cp target/release/alacritty ~/.local/bin
  cd ..
fi

if [ ! -d "alacritty-catpuccin" ] ; then
  git clone https://github.com/catpucchin/alacritty.git alacritty-catpuccin
fi

if [ ! -d "$HOME/.nvm" ] ; then
  git clone https://github.com/nvm-sh/nvm.git $HOME/.nvm
fi

if [ ! -d "$HOME/.oh-my-zsh" ] ; then
  git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
fi

if [ ! -d "$HOME/.pyenv" ] ; then
  git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv
fi

if [ ! -d "i3blocks" ] ; then
  git clone https://github.com/vivien/i3blocks
  cd i3blocks
  ./autogen.sh
  ./configure
  make
  sudo make install
  cd ..
fi

if [ ! -d "i3blocks-contrib" ] ; then
  git clone https://github.com/vivien/i3blocks-contrib.git
fi

cd ..