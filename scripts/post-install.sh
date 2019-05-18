pyenv install 3.7.3
pyenv install 3.6.8
pyenv global 3.7.3
python -m pip install --upgrade pip
pip install jedi neovim httpie
nvim --headless +PlugInstall +qa