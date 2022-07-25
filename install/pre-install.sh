#! /bin/bash

set -exu

wget -qO - https://regolith-desktop.org/regolith.key | gpg --dearmor | sudo tee /usr/share/keyrings/regolith-archive-keyring.gpg > /dev/null
echo -n "deb [arch=amd64 signed-by=/usr/share/keyrings/regolith-archive-keyring.gpg] " | sudo tee /etc/apt/sources.list.d/regolith.list
echo https://regolith-desktop.org/release-ubuntu-jammy-amd64 jammy main | sudo tee -a /etc/apt/sources.list.d/regolith.list