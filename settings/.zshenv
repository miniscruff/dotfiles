# local bin
PATH="$HOME/.local/bin:$PATH"
# nix bix
PATH="$HOME/.nix-profile/bin:$PATH"
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

# locale stuff
LOCALE_PATH=$(nix-build --no-out-link "<nixpkgs>" -A glibcLocales)
LOCALE_ARCHIVE=${LOCALE_PATH}/lib/locale/locale-archive
LOCALE_ARCHIVE_2_27=${LOCALE_ARCHIVE}
LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8
