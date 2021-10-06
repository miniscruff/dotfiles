#!/bin/bash
# to change upgrade packages run 'upgrade.sh' from any terminal

# update all our apt packages
update_apt()
{
    sudo apt update
    sudo apt upgrade -y
    sudo apt autoremove -y
}

# update oh my zshell
update_omz()
{
    omz update
}

# neovim packages
update_nvim()
{
    nvim --headless +PlugUpgrade +qall
    nvim --headless +'PlugClean!' +qall
    nvim --headless +UpdateRemotePlugins +qall
    nvim --headless +PlugUpdate +qa
    nvim --headless +CocUpdate +qall
}

update_apt
update_omz
update_nvim
