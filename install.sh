sudo apt install -y \
  software-properties-common \
  build-essential \
  curl \
  make \
  git
sudo apt upgrade -y
sudo apt update

# set mod for scripts
chmod 0755 scripts/apt-repositories.sh
chmod 0755 scripts/system-packages.sh
chmod 0755 scripts/git-packages.sh
chmod 0755 scripts/package-configs.sh
chmod 0755 scripts/symlinks.sh
chmod 0755 scripts/post-install.sh

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
