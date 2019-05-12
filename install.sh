# This file was auto generated
# View the readme on how to edit
# To regenerate run `python generate.py`

##########################
echo Installing Essentials
##########################

sudo apt install -y software-properties-common build-essential git
sudo apt upgrade -y
sudo apt update

############################
echo Adding Apt Repositories
############################

sudo add-apt-repository ppa:neovim-ppa/stable

###############################
echo Installing System Packages
###############################

sudo install -y g++ \ 
  gnutls-bin \ 
  libgtk-3-dev \ 
  neovim \ 
  libpcre2-dev \ 
  libgnutls28-dev \ 
  gperf \ 
  intltool \ 
  valac \ 
  libxml2-utils \ 
  gtk-doc-tools \ 
  libgirepository1.0-dev \ 
  libglib3.0-cil-dev

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


