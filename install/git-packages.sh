#! /bin/bash
set -exu

if [ ! -d "~/catpucchin/alacritty" ] ; then
    gh repo clone catpucchin/alacritty -- ~/projects/catpucchin/alacritty
fi

if [ ! -d "~/vivien/i3blocks-contrib" ] ; then
    gh repo clone vivien/i3blocks-contrib -- ~/projects/vivien/i3blocks-contrib
fi

if [ ! -d "~/miniscruff/changie" ] ; then
    gh repo clone miniscruff/changie -- ~/projects/miniscruff/changie
fi

if [ ! -d "~/miniscruff/changie-action" ] ; then
    gh repo clone miniscruff/changie-action -- ~/projects/miniscruff/changie-action
fi

if [ ! -d "~/miniscruff/genenv" ] ; then
    gh repo clone miniscruff/genenv -- ~/projects/miniscruff/genenv
fi
