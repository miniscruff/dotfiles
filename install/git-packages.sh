#! /bin/bash
set -exu

if [ ! -d "$HOME/projects/catppuccin/alacritty" ] ; then
    gh repo clone catppuccin/alacritty -- $HOME/projects/catppuccin/alacritty
fi

if [ ! -d "$HOME/projects/guibou/nixGL" ] ; then
    gh repo clone guibou/nixGL -- $HOME/projects/guibou/nixGL
fi

if [ ! -d "$HOME/projects/vivien/i3blocks-contrib" ] ; then
    gh repo clone vivien/i3blocks-contrib -- $HOME/projects/vivien/i3blocks-contrib
fi

if [ ! -d "$HOME/projects/miniscruff/changie" ] ; then
    gh repo clone miniscruff/changie -- $HOME/projects/miniscruff/changie
fi

if [ ! -d "$HOME/projects/miniscruff/changie-action" ] ; then
    gh repo clone miniscruff/changie-action -- $HOME/projects/miniscruff/changie-action
fi

if [ ! -d "$HOME/projects/miniscruff/genenv" ] ; then
    gh repo clone miniscruff/genenv -- $HOME/projects/miniscruff/genenv
fi
