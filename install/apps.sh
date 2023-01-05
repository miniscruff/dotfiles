#! /bin/bash
set -exu
BIN_DIR=$HOME/.local/bin
cd $HOME/apps

NVIM_VERSION="0.0.0"
if [ -f "NVIM_VERSION" ] ; then
    NVIM_VERSION=$(cat NVIM_VERSION)
fi
NVIM_LATEST=$(gh release -R neovim/neovim list --exclude-pre-releases --limit 1 | awk '{print $2}')
if [ "$NVIM_VERSION" != $NVIM_LATEST ] ; then
   wget https://github.com/neovim/neovim/releases/download/v${NVIM_LATEST}/nvim-linux64.tar.gz
   tar -xf nvim-linux64.tar.gz
   rm nvim-linux64.tar.gz
   mv nvim-linux64 nvim
   echo $NVIM_LATEST > NVIM_VERSION
fi

GH_VERSION="0.0.0"
if [ -f "GH_VERSION" ] ; then
    GH_VERSION=$(cat GH_VERSION)
fi
GH_LATEST=$(gh release -R cli/cli list --exclude-pre-releases --limit 1 | awk '{print $3}')
if [ "$GH_VERSION" != $GH_LATEST ] ; then
   wget https://github.com/cli/cli/releases/download/v${GH_LATEST}/gh_${GH_LATEST}_linux_amd64.tar.gz
   tar -xf gh_${GH_LATEST}_linux_amd64.tar.gz
   rm gh_${GH_LATEST}_linux_amd64.tar.gz
   mv gh_${GH_LATEST}_linux_amd64/bin/gh $BIN_DIR && rm -rf gh_${GH_LATEST}_linux_amd64
   echo $GH_LATEST > GH_VERSION
fi

cd $HOME/projects/miniscruff/dotfiles
