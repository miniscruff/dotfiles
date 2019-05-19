cd settings

mkdir $HOME/.config/i3
mkdir $HOME/.config/i3status
mkdir $HOME/.config/neofetch
mkdir $HOME/.config/nvim
mkdir $HOME/.config/ranger
mkdir $HOME/.config/termite

ln .zshrc $HOME/.zshrc
ln .profile $HOME/.profile
ln .config/nvim/init.vim $HOME/.config/nvim/init.vim
ln .config/neofetch/config.conf $HOME/.config/neofetch/config.conf
ln .config/i3/config $HOME/.config/i3/config
ln .config/termite/config $HOME/.config/termite/config
ln .config/ranger/rc.conf $HOME/.config/ranger/rc.conf
ln .config/i3status/config $HOME/.config/i3status/config

cd ..