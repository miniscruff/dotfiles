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
   rm -rf nvim-linux64
   wget https://github.com/neovim/neovim/releases/download/v${NVIM_LATEST}/nvim-linux64.tar.gz
   tar -xf nvim-linux64.tar.gz
   rm nvim-linux64.tar.gz
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

XC_VERSION="0.0.0"
if [ -f "XC_VERSION" ] ; then
    XC_VERSION=$(cat XC_VERSION)
fi
XC_LATEST=$(gh release -R joerdav/xc list --exclude-pre-releases --limit 1 | awk '{print $3}' | cut -c2-)
if [ "$XC_VERSION" != $XC_LATEST ] ; then
   wget https://github.com/joerdav/xc/releases/download/v${XC_LATEST}/xc_${XC_LATEST}_linux_amd64.tar.gz
   tar -xf xc_${XC_LATEST}_linux_amd64.tar.gz
   rm xc_${XC_LATEST}_linux_amd64.tar.gz
   mv xc $BIN_DIR && rm -rf xc
   echo $XC_LATEST > XC_VERSION
fi

cd $HOME/projects/miniscruff/dotfiles
