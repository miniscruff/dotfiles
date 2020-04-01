cd settings

mkdir $HOME/.config/fontconfig
mkdir $HOME/.config/i3
mkdir $HOME/.config/i3blocks
mkdir $HOME/.config/neofetch
mkdir $HOME/.config/nvim
mkdir $HOME/.config/qmk
mkdir $HOME/.config/ranger
mkdir $HOME/.config/rofi
mkdir $HOME/.config/termite
mkdir $HOME/.fonts

ln ".fonts/Hack Bold Italic Nerd Font Complete Mono.ttf" "$HOME/.fonts/Hack Bold Italic Nerd Font Complete Mono.ttf"
ln ".fonts/Hack Bold Nerd Font Complete Mono.ttf" "$HOME/.fonts/Hack Bold Nerd Font Complete Mono.ttf"
ln ".fonts/Hack Italic Nerd Font Complete Mono.ttf" "$HOME/.fonts/Hack Italic Nerd Font Complete Mono.ttf"
ln ".fonts/Hack Regular Nerd Font Complete Mono.ttf" "$HOME/.fonts/Hack Regular Nerd Font Complete Mono.ttf"
ln .config/fontconfig/fonts.conf $HOME/.config/fontconfig/fonts.conf
ln .config/i3/config $HOME/.config/i3/config
ln .config/i3blocks/cmus.sh $HOME/.config/i3blocks/cmus.sh
ln .config/i3blocks/config $HOME/.config/i3blocks/config
ln .config/neofetch/config.conf $HOME/.config/neofetch/config.conf
ln .config/nvim/init.vim $HOME/.config/nvim/init.vim
ln .config/qmk/qmk.ini $HOME/.config/qmk/qmk.ini
ln .config/ranger/rc.conf $HOME/.config/ranger/rc.conf
ln .config/rofi/config $HOME/.config/rofi/config
ln .config/rofi/flat-orange.rasi $HOME/.config/rofi/flat-orange.rasi
ln .config/termite/config $HOME/.config/termite/config
ln .gitignore $HOME/.gitignore
ln .zshrc $HOME/.zshrc

cd ..