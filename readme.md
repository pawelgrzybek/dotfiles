# dotfiles

Before doing anything, make sure you know what you're doing! The settings applied by this repository are highly personal and certainly not suitable for everyone. I recommend creating your own set of dotfiles based on this repository.

1. Install [brew](https://brew.sh).
1. SSH setup.
1. Clone this repo to the hidden `.dotfile` directory in your home directory
   (`git` comes with brew) -
   `git clone https://github.com/pawelgrzybek/dotfiles.git ~/.dotfiles`
1. Install brew formulas and casks - `~/.dotfiles/setup-brew.sh`
1. Setup macOS - `~/.dotfiles/setup-macos.sh`
1. Setup symlinks - `~/.dotfiles/setup-symlinks.sh`
1. Download apps from App Store - (Keynote, Numbers, Pages, Photomator, Pixelmator Pro)

## Claude setup

Claude Code stores MCP servers in `~/.claude.json`, which isn't practical to track here. Instead, re-add user-scoped MCP servers manually on each machine so they're available across all projects.

```sh
claude mcp add --transport http mdn -s user https://mcp.mdn.mozilla.net/
claude mcp add safari-mcp-stp -s user -- "/Applications/Safari Technology Preview.app/Contents/MacOS/safaridriver" --mcp
```
