#!/bin/bash
# to use add to i3 bindings - current binding is Mod+q
# can alter project path or init file below

PROJECT_PATH=$HOME/projects

REPOS=()
OWNERS=($(ls "${PROJECT_PATH}"))
for OWNER in "${OWNERS[@]}"
do
    NEW_REPOS=($(ls $PROJECT_PATH/${OWNER}))
    for REPO in "${NEW_REPOS[@]}"
    do
        REPOS+=("$OWNER/$REPO")
    done
done

ROFI_REPOS=$(printf "%s," "${REPOS[@]}")

SELECT=$(echo -e $ROFI_REPOS | rofi -dmenu -p "Repo" -sep ",")
if [ -z "$SELECT" ]; then
    exit 0
fi
echo $SELECT

i3 exec "$HOME/.local/bin/alacritty --working-directory $PROJECT_PATH/$SELECT"
