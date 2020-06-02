mkdir packages
cd packages

git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh

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

git clone https://github.com/vivien/i3blocks
cd i3blocks
./autogen.sh
./configure
make
sudo make install
cd ..

git clone https://github.com/vivien/i3blocks-contrib.git

git clone https://github.com/Airblader/xcb-util-xrm
cd xcb-util-xrm
git submodule update --init
./autogen.sh --prefix=/usr
make
sudo make install
cd ..

git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
autoreconf --force --install
rm -rf build
./configure --prefix=/usr --sysconfdir=/etc
make
sudo make install
cd ..

git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv

git clone https://github.com/nvm-sh/nvm.git $HOME/.nvm

cd ..