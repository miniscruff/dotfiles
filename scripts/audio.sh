#!/bin/bash
select=$(pacmd list-sinks | awk '/name:/ {gsub("<", ""); gsub(">", ""); print $2}' | rofi -dmenu -i -p "Audio Device")

if [ -z "$select" ]; then
    exit 0
fi

echo pacmd set-default-sink ${select}
pacmd set-default-sink ${select}
