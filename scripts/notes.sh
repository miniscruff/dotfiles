#!/bin/bash
notes_path=$HOME/.notes
title="floating"

lists=$(ls $notes_path)
show=$(echo "$lists" | dmenu -i -p "Notes")

if [ -z "$show" ]; then
    exit 0
fi

section=$(grep '^## ' $notes_path/$show | cut -d ' ' -f2- | dmenu -i -p "Section")
if [ -z "$section"]; then
    i3 exec "termite -e nvim\ $notes_path/$show -t $title"
else
    line=$(grep "^## $section" $notes_path/$show -n | cut -d ':' -f1)
    i3 exec "termite -e nvim\ $notes_path/$show\ +:$line -t $title"
fi
