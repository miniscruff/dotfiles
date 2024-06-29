# local bin
PATH="$HOME/.local/bin:$PATH"
PATH="$PATH:$HOME/.cargo/bin"

# go bin
GOPATH="$HOME/go"
GOROOT="$HOME/.go"
PATH="$PATH:$HOME/.local/bin/go/bin"
PATH="$PATH:$HOME/go/bin"

# flyctl
export FLYCTL_INSTALL="/home/ronnie/.fly"
PATH="$FLYCTL_INSTALL/bin:$PATH"

# useful vars
export DOTFILES="$HOME/projects/miniscruff/dotfiles"
export BIN_DIR="$HOME/.local/bin"
export EDITOR=nvim
export PAGER="bat -p"
export GPG_TTY=$TTY

# language info
LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8

