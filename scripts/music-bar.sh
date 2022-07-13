#!/bin/bash
# this script is used to update the i3-bar section for currently playing music
# it only works when using https://github.com/ytmdesktop/ytmdesktop

URL="-s http://localhost:9863/query"

paused=$(curl ${URL} | jq .player.isPaused)
author=$(curl ${URL} | jq .track.author)
title=$(curl ${URL} | jq .track.title)

button="${1}"
if [ "$button" = "1" ]; then
    resp=$(curl ${URL} -X POST -d '{"command": "track-play"}' -H "Content-Type: application/json")
    # update the paused var for this run, otherwise there is a delay
    if [ "${paused}" = "true" ]; then
        paused="false"
    else
        paused="true"
    fi
elif [ "$button" = "3" ]; then
    resp=$(curl ${URL} -X POST -d '{"command": "track-next"}' -H "Content-Type: application/json")
    sleep 1
    author=$(curl ${URL} | jq .track.author)
    title=$(curl ${URL} | jq .track.title)
fi

if [ "${paused}" = "true" ]; then
    echo ⏸  ${title:1:${#title}-2} by ${author:1:${#author}-2}
else
    echo ▶  ${title:1:${#title}-2} by ${author:1:${#author}-2}
fi
