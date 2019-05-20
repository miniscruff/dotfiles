#!/bin/sh
artist=$(cmus-remote -Q | grep artist | cut -d ' ' -f3-)
title=$(cmus-remote -Q | grep title | cut -d ' ' -f3-)
if [ ! -z "$artist" ]; then
    echo $artist - $title
fi
