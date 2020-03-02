#!/bin/bash
# in order to use create a txt file with lines of songs
# where each line is space separated youtube code, artist, song name
# such as:
# CYDP_8UTAus Neffex "Fight Back"
# then run this script using the file:
# music-dl.sh < music.txt

while IFS= read -r line; do
    set --                                   # clear the argument list
    while IFS= read -r -d '' element; do     # read a NUL-delimited element
      set -- "$@" "$element"                 # append to the argument list
    done < <(xargs printf '%s\0' <<<"$line") # write NUL-delimited elements

    url=$1
    artist=$2
    title=$3

    output="$HOME/Music/$artist - $title.mp3"
    if [ ! -f "$output" ]; then
        youtube-dl --audio-format mp3 \
            --audio-quality 0 \
            --extract-audio \
            --exec "mid3v2 -a \"$artist\" -t \"$title\" {} && mv {} \"$output\""  \
            "$url"
    fi
done

echo Done
