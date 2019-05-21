#!/bin/sh
notes_path=.notes

lists=$(ls $notes_path | grep -v menu.sh)
show=$(echo "$lists" | dmenu -i -p "Notes")

if [ -z "$show" ]; then
    exit 0
fi

section=$(grep '^## ' $notes_path/$show | cut -d ' ' -f2- | dmenu -i -p "Section")
if [ -z "$section"]; then
    i3 exec "termite -e nvim\ $notes_path/$show -t cheats"
else
    line=$(grep "^## $section" $notes_path/$show -n | cut -d ':' -f1)
    i3 exec "termite -e nvim\ $notes_path/$show\ +:$line -t cheats"
fi
