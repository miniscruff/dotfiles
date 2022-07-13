wget -O go.tar.gz https://dl.google.com/go/go1.17.12.linux-amd64.tar.gz
tar -C ${HOME}/.local/bin -xvf go.tar.gz
rm -f go.tar.gz
export NVM_HOME="$HOME/.nvm"
source $HOME/.nvm/nvm.sh
nvm install node
npm install -g dockerfile-language-server-nodejs
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
pyenv install 3.9.0
pyenv global 3.9.0
python -m pip install --upgrade pip
chsh -s $(which zsh)
curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim