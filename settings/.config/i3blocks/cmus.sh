#!/bin/bash

if [[ "$BLOCK_BUTTON" -eq 1 ]]; then
    status=$(cmus-remote -Q | grep status | cut -d ' ' -f2-)
    case "$status" in
        paused) $(cmus-remote -p) ;;
        playing) $(cmus-remote -u) ;;
    esac
fi

status=$(cmus-remote -Q | grep status | cut -d ' ' -f2-)
if [ -z "$status" ]; then
    exit
fi

case "$status" in
    paused) status_display="" ;;
    playing) status_display="" ;;
esac

artist=$(cmus-remote -Q | grep artist | cut -d ' ' -f3-)
title=$(cmus-remote -Q | grep title | cut -d ' ' -f3-)
if [ ! -z "$artist" ]; then
    echo "$status_display $artist - $title"
fi
