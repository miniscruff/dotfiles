cd settings

mkdir $HOME/.config/fontconfig
mkdir $HOME/.config/i3
mkdir $HOME/.config/i3status
mkdir $HOME/.config/neofetch
mkdir $HOME/.config/nvim
mkdir $HOME/.config/ranger
mkdir $HOME/.config/termite
mkdir $HOME/.fonts

ln .zshrc $HOME/.zshrc
ln .profile $HOME/.profile
ln ".fonts/Hack Bold Nerd Font Complete Mono.ttf" "$HOME/.fonts/Hack Bold Nerd Font Complete Mono.ttf"
ln ".fonts/Hack Regular Nerd Font Complete Mono.ttf" "$HOME/.fonts/Hack Regular Nerd Font Complete Mono.ttf"
ln ".fonts/Hack Italic Nerd Font Complete Mono.ttf" "$HOME/.fonts/Hack Italic Nerd Font Complete Mono.ttf"
ln ".fonts/Hack Bold Italic Nerd Font Complete Mono.ttf" "$HOME/.fonts/Hack Bold Italic Nerd Font Complete Mono.ttf"
ln .config/nvim/init.vim $HOME/.config/nvim/init.vim
ln .config/neofetch/config.conf $HOME/.config/neofetch/config.conf
ln .config/i3/config $HOME/.config/i3/config
ln .config/termite/config $HOME/.config/termite/config
ln .config/fontconfig/fonts.conf $HOME/.config/fontconfig/fonts.conf
ln .config/ranger/rc.conf $HOME/.config/ranger/rc.conf
ln .config/i3status/config $HOME/.config/i3status/config

cd ..