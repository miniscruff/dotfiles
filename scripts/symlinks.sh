cd settings

mkdir $HOME/.config/neofetch
mkdir $HOME/.config/nvim
mkdir $HOME/.config/termite

ln .zshrc $HOME/.zshrc
ln .config/nvim/init.vim $HOME/.config/nvim/init.vim
ln .config/neofetch/config.conf $HOME/.config/neofetch/config.conf
ln .config/termite/config $HOME/.config/termite/config

cd ..