#!/bin/bash
wm_line=$(xdotool search --name "YouTube Music" | xargs -l xprop -id | grep _NET_WM_NAME)
if [ -z "${wm_line}" ]; then
    exit 0
fi

title=$(echo ${wm_line} | cut -c 30- | tr -d '"')
if [ "$title" = "YouTube Music" ]; then
    echo ♪ paused ♪
else
    song_name=$(echo $title | sed 's/ - YouTube Music//')
    echo ♪ ${song_name} ♪
fi
