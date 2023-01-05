# local bin
PATH="$HOME/.local/bin:$PATH"
PATH="$PATH:$HOME/.cargo/bin"
# go bin
GOPATH="$HOME/go"
GOROOT="$HOME/.go"
PATH="$PATH:$HOME/.local/bin/go/bin"
PATH="$PATH:$HOME/go/bin"

# useful vars
DOTFILES="$HOME/projects/miniscruff/dotfiles"
EDITOR=nvim
GPG_TTY=$TTY

# version managers
gvm="$GOPATH/bin/g"

# language info
LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8

source $HOME/.zshaliases
