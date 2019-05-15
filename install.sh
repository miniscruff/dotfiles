# This file was auto generated
# View the readme on how to edit
# To regenerate run `python generate.py`

echo #####################
echo Installing Essentials
echo #####################

sudo apt install -y \
  software-properties-common \
  build-essential \
  curl \
  git
sudo apt upgrade -y
sudo apt update

git clone https://github.com/miniscruff/dotfiles.git

echo #######################
echo Adding Apt Repositories
echo #######################

sudo add-apt-repository -y \
  ppa:neovim-ppa/stable

echo ##########################
echo Installing System Packages
echo ##########################

sudo apt install -y \
  g++ \
  gnutls-bin \
  gperf \
  gtk-doc-tools \
  intltool \
  libgirepository1.0-dev \
  libglib3.0-cil-dev \
  libgnutls28-dev \
  libgtk-3-dev \
  libpcre2-dev \
  libxml2-utils \
  neovim \
  valac

echo #######################
echo Installing Git Packages
echo #######################

cd dotfiles
mkdir packages
cd packages

echo Installing vte-ng
git clone https://github.com/thestinger/vte-ng.git
cd vte-ng
echo export LIBRARY_PATH="/usr/include/gtk-3.0:$LIBRARY_PATH"
./autogen.sh
make
sudo make install
cd ..

echo Installing termite
git clone --recursive https://github.com/thestinger/termite.git
cd termite
make
sudo make install
sudo ldconfig
sudo mkdir -p /lib/terminfo/x
sudo ln -s /usr/local/share/terminfo/x/xterm-termite /lib/terminfo/x/xterm-termite
cd ..

cd ../..

echo #######################
echo Running package configs
echo #######################

curl -fLo .config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim --headless +PlugInstall +qa

echo #################
echo Creating symlinks
echo #################

ln dotfiles/settings/.zshrc .zshrc
ln dotfiles/settings/.config/nvim/init.vim .config/nvim/init.vim

echo #########
echo Completed
echo #########

