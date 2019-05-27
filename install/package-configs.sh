chsh -s $(which zsh)
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
pyenv install 3.7.3
pyenv install 3.6.8
pyenv global 3.7.3
python -m pip install --upgrade pip
pip install pipx
curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim