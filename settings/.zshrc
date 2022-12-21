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

# Completions
source "$NVM_DIR/bash_completion"
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

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
    grep -v "known_hosts\|.*pub\|authorized\|config" | \
    xargs -I{} ssh-add $HOME/.ssh/{}

# source .init.sh if it exists
if test -f ".init.sh"; then
    source ".init.sh"
fi
