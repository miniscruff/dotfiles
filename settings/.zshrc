# zsh stuff
ZSH_THEME="avit"
plugins=(
  git
  golang
  nvm
)

export ZSH="$HOME/projects/ohmyzsh/ohmyzsh"
export ZSH_CACHE_DIR=$HOME/.cache
source $ZSH/oh-my-zsh.sh

# Completions
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /home/ronnie/.local/bin/xc xc

# Brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Functions
copy () {
    xclip -selection clipboard -i
}

# Configure ssh keys
eval "$(ssh-agent -s)"
ls $HOME/.ssh | \
    grep -v "known_hosts\|.*pub\|authorized\|config" | \
    xargs -I{} ssh-add $HOME/.ssh/{}
