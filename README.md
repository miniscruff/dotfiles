# Dotfiles

Personal dotfile configurations and bootstrapping process.

## Getting Started

On a new machine download git and clone this repo.
Then run the install.sh script.

## How to add

Files inside settings are symlinked into the home directory on install.
Scripts folder is also copied but also added to your path.
JSON files in templates are built into the install scripts.

## How to customize

JSON files inside templates are exported into shell scripts.
These are configured to run in a certain order and the specs are below.
After making any change run `python generate.py` using python 3.6+.
No packages are required so no need for a virtual environment.

### Apt Repositories

An array of apt repositories to add.

```json
{
    "apt-repository": ["ppa:neovim-ppa/stable"]
}
```

### System Packages

An array of ubuntu system packages to install.

```json
{
    "system-packages": ["i3status", "rofi"]
}
```

### Git Packages

An array of git packages to install and configure.
Git packages are cloned and placed inside the ignored "packages" folder.
They are not added to the system path or anything.

Optionally you can specify a path and commands.
These commands will be ran inside the cloned path after cloning.
Note that in order to run post clone commands you need to add the path.

Special note that the clone command is simply added to `git clone` so you can
add extra parameters such as the optional path.

```json
{
    "git-packages": [
        {
            "clone": "https://github.com/vivien/i3blocks-contrib.git"
        },
        {
            "clone": "https://github.com/vivien/i3blocks",
            "path": "i3blocks",
            "commands": [
                "./autogen.sh",
                "./configure",
                "make",
                "sudo make install"
            ]
        }
    ]
}
```

### Package configs

An array of shell commands to run in order.
This will be run after all installs but are in an arbitrary order from json files.
If you need to make sure a command runs after all others, use post install.

```json
{
    "package-configs": [
        "echo hey",
        "cat README.md"
    ]
}
```

### Symlinks

This part symlinks all the files and folders inside settings to your home directory.

### Post Install

An array of shell commands to run in order.
This is the last part of the installation.

```json
{
    "post-install": [
        "echo hey",
        "cat README.md"
    ]
}
```

## Specific Help

### QMK

QMK is the keyboard firmware for my preferred keyboard, the planck.
It requires building and flashing for updates.
Inside /packages/qmk\_firmware is my fork of the official release.
After making changes:

1. run `qmk compile`
1. run `qmk flash`
    1. press `raise+lower+backspace` to when output says "bootloader not found"
1. wait a few seconds for keyboard to restart
