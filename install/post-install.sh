git config --global core.excludesfile ~/.gitignore
pipx install qmk
qmk setup miniscruff/qmk_firmware ./packages/qmk_firmware --branch miniscruff -y
pip install jedi neovim
pipx install httpie poetry
nvim --headless +PlugInstall +qa