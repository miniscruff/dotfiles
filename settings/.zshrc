# zsh stuff
ZSH_THEME="avit"
plugins=(
  git
  kubectl
  golang
  nvm
)

export ZSH="$HOME/.oh-my-zsh"
export ZSH_CACHE_DIR=$HOME/.cache
source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR=nvim
export QMK_HOME="$HOME/dotfiles/packages/qmk_firmware"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export GVM_HOME="$HOME/.gvm"
eval "$(pyenv init -)"

export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"
source "$NVM_DIR/bash_completion"
source "$GVM_HOME/scripts/gvm"

# add extra directories to our path
export PATH="$PATH:$HOME/dotfiles/scripts"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/bin/go/bin"
export GPG_TTY=$TTY

# Functions
copy () {
    xclip -selection clipboard -i
}

brightness () {
    xrandr | grep " connected" | awk '{print $1}' | xargs -l -i xrandr --output {} --brightness $1
}

# Configure ssh keys
eval "$(ssh-agent -s)"
ls $HOME/.ssh | \
    grep -v "known_hosts\|.*pub\|authorized" | \
    xargs -I{} ssh-add $HOME/.ssh/{}

neofetch

# will load the file on start, usually an init file
if [[ $1 == file ]]
then
    source "$2"
set --
fi
