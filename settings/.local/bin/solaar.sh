#!/bin/bash
# Script outputs the first device that solaar has connected.
# For me, this is a gaming mouse.

# constants
FA_LIGHTNING="<span color='yellow'>⚡</span>"
FA_BATTERY="<span color='red'>🪫</span>"

deviceName=$(solaar show | grep -A 1 "DEVICE NAME" | grep Name: | cut -c 19-)
batLevel=$(solaar show "$deviceName" | grep -m 1 Battery)

batPerc=$(echo "$batLevel" | awk '{print $2}')
chargeState=$(echo "$batLevel" | awk '{print $5}')

icon=$FA_LIGHTNING
if [ "$chargeState" = "discharging." ]; then
    icon=$FA_BATTERY
fi

echo $deviceName $batPerc $icon
