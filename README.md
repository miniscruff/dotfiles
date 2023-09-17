# Dotfiles

Personal dotfile configurations and bootstrapping process.

## Getting Started

1. Download git and clone this repo at `$HOME/projects/miniscruff/dotfiles`
1. Download paid fonts and place them in `.fonts`
1. Then run the `install.sh` script.

## How to add

1. Update the tools list in `main.go`
1. Run `go run main.go`
1. Run `upgrade.sh` to upgrade all tools and packages

## QMK Help

QMK is the keyboard firmware for my preferred keyboard, the planck.
It requires building and flashing for updates.
Inside /packages/qmk\_firmware is my fork of the official release.
After making changes:

1. run `qmk compile`
1. run `qmk flash`
    1. press `raise+lower+backspace` to when output says "bootloader not found"
1. wait a few seconds for keyboard to restart

## Tasks
Below is a list of common development tasks, these can easily be run using [xc](https://xcfile.dev/).
For example `xc test` will run the test suite.

### lint
```
goimports -w -local github.com/miniscruff/dotfiles .
golangci-lint run ./...
```

### run
Generate scripts

```
go run .
```
