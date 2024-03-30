# dotfiles

Before doing anything, make sure you know what you're doing! The settings applied by this repository are highly personal and certainly not suitable for everyone. I recommend creating your own set of dotfiles based on this repository.
1. Install [brew](https://brew.sh).
1. SSH setup.
1. Clone this repo to the hidden `.dotfile` directory in your home directory (`git` comes with brew) - `git clone https://github.com/pawelgrzybek/dotfiles.git ~/.dotfile`
1. Install brew formulas and casks - `source ~/.dotfiles/setup-brew.sh`
1. Download your fav apps from app store- (Keynote, Ivory, Numbers, Pages, Photomator, Reeder)
1. Setup macOS - `source ~/.dotfiles/setup-macos.sh`
1.  Setup symlinks - `source ~/.dotfiles/setup-symlinks.sh`
1.  Setup pnpm globals - `source ~/.dotfiles/setup-pnpm.sh`
