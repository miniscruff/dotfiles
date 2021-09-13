cd settings

mkdir -p $HOME/.config/fontconfig
mkdir -p $HOME/.config/i3
mkdir -p $HOME/.config/i3blocks
mkdir -p $HOME/.config/neofetch
mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.config/qmk
mkdir -p $HOME/.config/ranger
mkdir -p $HOME/.config/rofi
mkdir -p $HOME/.config/termite
mkdir -p $HOME/.fonts

ln -f ".fonts/Hack Bold Italic Nerd Font Complete Mono.ttf" "$HOME/.fonts/Hack Bold Italic Nerd Font Complete Mono.ttf"
ln -f ".fonts/Hack Bold Nerd Font Complete Mono.ttf" "$HOME/.fonts/Hack Bold Nerd Font Complete Mono.ttf"
ln -f ".fonts/Hack Italic Nerd Font Complete Mono.ttf" "$HOME/.fonts/Hack Italic Nerd Font Complete Mono.ttf"
ln -f ".fonts/Hack Regular Nerd Font Complete Mono.ttf" "$HOME/.fonts/Hack Regular Nerd Font Complete Mono.ttf"
ln -f .config/fontconfig/fonts.conf $HOME/.config/fontconfig/fonts.conf
ln -f .config/i3/config $HOME/.config/i3/config
ln -f .config/i3blocks/config $HOME/.config/i3blocks/config
ln -f .config/neofetch/config.conf $HOME/.config/neofetch/config.conf
ln -f .config/nvim/coc-settings.json $HOME/.config/nvim/coc-settings.json
ln -f .config/nvim/init.vim $HOME/.config/nvim/init.vim
ln -f .config/qmk/qmk.ini $HOME/.config/qmk/qmk.ini
ln -f .config/ranger/rc.conf $HOME/.config/ranger/rc.conf
ln -f .config/rofi/config $HOME/.config/rofi/config
ln -f .config/termite/config $HOME/.config/termite/config
ln -f .gitignore $HOME/.gitignore
ln -f .zshrc $HOME/.zshrc

cd ..