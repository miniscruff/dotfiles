nvim --headless +PlugInstall +qa
pip install jedi neovim
pipx install httpie poetry
pipx install qmk
qmk setup miniscruff/qmk_firmware ./packages/qmk_firmware --branch miniscruff -y
git config --global core.excludesfile ~/.gitignore