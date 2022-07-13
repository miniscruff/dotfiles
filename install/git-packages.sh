mkdir packages
cd packages

git clone https://github.com/nvm-sh/nvm.git $HOME/.nvm

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

git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv

git clone https://github.com/miniscruff/qmk_firmware

git clone https://github.com/vivien/i3blocks
cd i3blocks
./autogen.sh
./configure
make
sudo make install
cd ..

git clone https://github.com/vivien/i3blocks-contrib.git

git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh

cd ..