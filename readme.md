# dotfiles

Before doing anything, make sure you know what you're doing! The settings applied by this repository are highly personal and certainly not suitable for everyone. I recommend creating your own set of dotfiles based on this repository.

1. Install [brew](https://brew.sh).
1. SSH setup.
1. Clone this repo to the hidden `.dotfiles` directory in your home directory
   (`git` comes with brew) -
   `git clone https://github.com/pawelgrzybek/dotfiles.git ~/.dotfiles`
1. Install brew formulas and casks - `~/.dotfiles/setup-brew.sh`
1. Setup macOS - `~/.dotfiles/setup-macos.sh`
1. Setup symlinks - `~/.dotfiles/setup-symlinks.sh`
1. Download apps from App Store - (Keynote, Numbers, Pages, Photomator, Pixelmator Pro)

## Claude and Codex setup

Only the shared `AGENTS.md` and `skills/` are tracked here. Harness settings (`~/.claude/settings.json`, `~/.codex/config.toml`) are managed by the apps themselves. After adding a new skill, re-run `~/.dotfiles/setup-symlinks.sh` so Claude Code picks it up.

Claude Code stores MCP servers in `~/.claude.json`, which isn't practical to track here. Instead, re-add user-scoped MCP servers manually on each machine so they're available across all projects.

```sh
claude mcp add --transport http mdn -s user https://mcp.mdn.mozilla.net/
claude mcp add safari-mcp-stp -s user -- "/Applications/Safari Technology Preview.app/Contents/MacOS/safaridriver" --mcp
```
