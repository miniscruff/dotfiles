mkdir packages
cd packages

git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh

git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv

git clone https://github.com/thestinger/vte-ng.git
cd vte-ng
echo export LIBRARY_PATH="/usr/include/gtk-3.0:$LIBRARY_PATH"
./autogen.sh
make
sudo make install
cd ..

git clone --recursive https://github.com/thestinger/termite.git
cd termite
make
sudo make install
sudo ldconfig
sudo mkdir -p /lib/terminfo/x
sudo ln -s /usr/local/share/terminfo/x/xterm-termite /lib/terminfo/x/xterm-termite
cd ..

cd ..