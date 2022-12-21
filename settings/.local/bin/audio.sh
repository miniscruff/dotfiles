#!/bin/bash
# to change audio source run 'audio.sh' from any terminal

select=$(pacmd list-sinks | awk '/name:/ {gsub("<", ""); gsub(">", ""); print $2}' | rofi -dmenu -i -p "Audio Device")

if [ -z "$select" ]; then
    exit 0
fi

pacmd set-default-sink ${select}
