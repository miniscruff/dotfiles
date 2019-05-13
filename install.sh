# This file was auto generated
# View the readme on how to edit
# To regenerate run `python generate.py`

##########################
echo Installing Essentials
##########################

sudo apt install -y \
  software-properties-common \
  build-essential \
  curl \
  git
sudo apt upgrade -y
sudo apt update

############################
echo Adding Apt Repositories
############################

sudo add-apt-repository \
  ppa:neovim-ppa/stable

###############################
echo Installing System Packages
###############################

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

############################
echo Installing Git Packages
############################

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


############################
echo Running package configs
############################

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim --headless +PlugInstall +qa

######################
echo Creating symlinks
######################

ln dotfiles/settings ~/.zshrc
ln dotfiles/settings/.config/nvim ~/init.vim

##############
echo Completed
##############

