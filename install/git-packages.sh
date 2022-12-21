#! /bin/bash
set -exu

if [ ! -d "~/projects/catpucchin/alacritty" ] ; then
    gh repo clone catpucchin/alacritty -- ~/projects/catpucchin/alacritty
fi

if [ ! -d "~/projects/vivien/i3blocks-contrib" ] ; then
    gh repo clone vivien/i3blocks-contrib -- ~/projects/vivien/i3blocks-contrib
fi

if [ ! -d "~/projects/miniscruff/changie" ] ; then
    gh repo clone miniscruff/changie -- ~/projects/miniscruff/changie
fi

if [ ! -d "~/projects/miniscruff/changie-action" ] ; then
    gh repo clone miniscruff/changie-action -- ~/projects/miniscruff/changie-action
fi

if [ ! -d "~/projects/miniscruff/genenv" ] ; then
    gh repo clone miniscruff/genenv -- ~/projects/miniscruff/genenv
fi
