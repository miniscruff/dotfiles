#!/bin/bash
# to use add to i3 bindings - current binding is Mod+q
# can alter project path or init file below

projects_path=$HOME/projects
select=$(ls "$projects_path" | rofi -dmenu -i -p "Projects")

if [ -z "$select" ]; then
    exit 0
fi

dir_opt="$projects_path/$select"
i3 exec "alacritty --working-directory $projects_path/$select"
