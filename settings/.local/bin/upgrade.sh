#! /bin/zsh
set -exu

sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
$DOTFILES/install/apt.sh
$DOTFILES/install/apps.sh
$DOTFILES/install/git-packages.sh

$DOTFILES/install/symlinks.sh

git -C $HOME/projects/catppuccin/alacritty pull
git -C $HOME/projects/rust-lang/rustup pull
git -C $HOME/projects/ohmyzsh/ohmyzsh pull
git -C $HOME/projects/alacritty/alacritty pull
git -C $HOME/projects/vivien/i3blocks-contrib pull

nvim --headless +UpdateRemotePlugins +qall
nvim --headless +PackerSync +qall
nvim --headless +PackerClean +qall
gh extensions upgrade --all

pushd $HOME/projects/rust-lang/rustup
./rustup-init.sh --no-modify-path --profile default -y
popd
pushd $HOME/projects/alacritty/alacritty
cargo build --release
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
cp target/release/alacritty $BIN_DIR/
popd

