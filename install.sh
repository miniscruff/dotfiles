#! /bin/sh

set -exu

mkdir -p $HOME/.local/bin

sudo apt install -y \
  software-properties-common \
  build-essential \
  curl \
  make
sudo apt upgrade -y
sudo apt update

./install/pre-install.sh

./install/apt-repositories.sh
sudo apt upgrade -y
sudo apt update

./install/system-packages.sh
./install/git-packages.sh
./install/package-configs.sh
./install/symlinks.sh
./install/post-install.sh

sudo apt auto-remove -y

echo #########
echo Completed
echo #########
