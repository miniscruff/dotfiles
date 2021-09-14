chsh -s $(which zsh)
wget -O go.tar.gz https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz
tar -C ${HOME}/.local/bin -xvf go.tar.gz
rm -f go.tar.gz
curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
pyenv install 3.7.3
pyenv install 3.6.8
pyenv global 3.7.3
python -m pip install --upgrade pip
pip install pipx
export NVM_HOME="$HOME/.nvm"
source $HOME/.nvm/nvm.sh
nvm install node
npm install -g dockerfile-language-server-nodejs