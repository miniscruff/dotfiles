sudo apt install -y \
  software-properties-common \
  build-essential \
  curl \
  make \
  git
sudo apt upgrade -y
sudo apt update

# Run generated scripts
./scripts/apt-repositories.sh
./scripts/system-packages.sh
./scripts/git-packages.sh
./scripts/package-configs.sh
./scripts/symlinks.sh
./scripts/post-install.sh

echo #########
echo Completed
echo #########
