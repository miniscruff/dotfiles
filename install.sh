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
  make \
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
  fonts-hack-ttf \
  g++ \
  gnutls-bin \
  gperf \
  gtk-doc-tools \
  intltool \
  libbz2-dev \
  libffi-dev \
  libgirepository1.0-dev \
  libglib3.0-cil-dev \
  libgnutls28-dev \
  libgtk-3-dev \
  liblzma-dev \
  libncurses5-dev \
  libncursesw5-dev \
  libpcre2-dev \
  libreadline-dev \
  libsqlite3-dev \
  libssl-dev \
  libxml2-utils \
  llvm \
  neovim \
  python-openssl \
  tk-dev \
  valac \
  xz-utils \
  zlib1g-dev \
  zsh

echo #######################
echo Installing Git Packages
echo #######################

cd dotfiles
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

cd ../..

echo #######################
echo Running package configs
echo #######################

chsh -s $(which zsh)
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
curl -fLo .config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo #################
echo Creating symlinks
echo #################

mkdir .config/nvim
mkdir .config/termite

ln dotfiles/settings/.zshrc .zshrc
ln dotfiles/settings/.config/nvim/init.vim .config/nvim/init.vim
ln dotfiles/settings/.config/termite/config .config/termite/config

echo ####################
echo Running post install
echo ####################

pyenv install 3.7.3
pyenv install 3.6.8
pyenv global 3.7.3
python -m pip install --upgrade pip
pip install jedi neovim httpie
nvim --headless +PlugInstall +qa

echo #########
echo Completed
echo #########

