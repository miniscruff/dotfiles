#!/bin/bash
# to use add to i3 bindings
# can alter project path or init file below
projects_path=$HOME/projects
init_file=init.sh

projs=$(ls $projects_path)
select=$(echo "$projs" | rofi -dmenu -i -p "Projects")

if [ -z "$select" ]; then
    exit 0
fi

dir_opt="-d $projects_path/$select"
if [ -f "$projects_path/$select/$init_file" ]; then
    startup="-e zsh\ -is\ file\ $init_file"
else
    startup=""
fi
i3 exec "termite $startup $dir_opt"
