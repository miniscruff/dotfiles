#! /bin/bash
set -exu

if [ ! -d "$HOME/projects/catppuccin/alacritty" ] ; then
    gh repo clone catppuccin/alacritty -- $HOME/projects/catppuccin/alacritty
fi

if [ ! -d "$HOME/projects/ohmyzsh/ohmyzsh" ] ; then
    gh repo clone ohmyzsh/ohmyzsh -- $HOME/projects/ohmyzsh/ohmyzsh
fi

if [ ! -d "$HOME/projects/vivien/i3blocks-contrib" ] ; then
    gh repo clone vivien/i3blocks-contrib -- $HOME/projects/vivien/i3blocks-contrib
fi
