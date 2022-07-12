# zsh stuff
ZSH_THEME="avit"
plugins=(
  git
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
export GPG_TTY=$TTY
eval "$(pyenv init -)"

# Version managers
export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"

# add extra directories to our path
export PATH="$PATH:$HOME/dotfiles/scripts"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/bin/go/bin"
export PATH="$HOME/.cargo/bin:$PATH"

# Completions
source "$NVM_DIR/bash_completion"
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C aws_completer aws

# Functions
copy () {
    xclip -selection clipboard -i
}

brightness () {
    xrandr | grep " connected" | awk '{print $1}' | xargs -l -i xrandr --output {} --brightness $1
}

kubectl_complete () {
    alias k=kubectl
    source <(kubectl completion zsh)
}

# Configure ssh keys
eval "$(ssh-agent -s)"
ls $HOME/.ssh | \
    grep -v "known_hosts\|.*pub\|authorized\|config" | \
    xargs -I{} ssh-add $HOME/.ssh/{}

# source .init.sh if it exists
if test -f ".init.sh"; then
    source ".init.sh"
fi

