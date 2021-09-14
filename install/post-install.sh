nvim --headless +PlugInstall +UpdateRemotePlugins +qa
nvim --headless +'CocInstall -sync coc-json coc-go coc-markdownlint coc-css coc-yaml coc-pyright coc-tsserver' +qall
pip install jedi neovim
pipx install httpie poetry
pipx install qmk
qmk setup miniscruff/qmk_firmware --branch miniscruff -y
git config --global core.excludesfile ~/.gitignore