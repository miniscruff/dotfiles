#!/bin/bash
window_name=$(xdotool search --name "YouTube Music" | xargs -l xprop -id | grep _NET_WM_NAME)
if [ -z "${window_name}" ]; then
    exit 0
fi
IFS='-' read -ra splits <<< "${window_name}"
if [ -z "${splits[0]}" ]; then
    exit 0
fi
echo ♪ $(echo ${splits[0]} | cut -c 30-) ♪
