#! /bin/sh

set -exu

sudo apt install -y \
  software-properties-common \
  build-essential \
  curl \
  make
sudo apt upgrade -y
sudo apt update

# Run generated install
./install/apt-repositories.sh
./install/system-packages.sh
./install/git-packages.sh
./install/package-configs.sh
./install/symlinks.sh
./install/post-install.sh

echo #########
echo Completed
echo #########
