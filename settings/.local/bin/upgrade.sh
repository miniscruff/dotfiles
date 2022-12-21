#!/bin/zsh
# to upgrade packages run 'upgrade.sh' from any terminal

update_apt()
{
    sudo apt update
    sudo apt upgrade -y
    sudo apt autoremove -y
}

update_nvim()
{
    # rewrite using packer
    nvim --headless +PlugUpgrade +qall
    nvim --headless +'PlugClean!' +qall
    nvim --headless +UpdateRemotePlugins +qall
    nvim --headless +PlugUpdate +qa
}

update_nix()
{
    nix-channel --update
    nix-env -iA nixpkgs.nix nixpkgs.cacert
    nix-env -iA nixpkgs.defaultSystem
}

update_apt
update_nix
update_nvim
