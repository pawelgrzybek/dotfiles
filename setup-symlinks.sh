#!/bin/zsh

# Create directories if they don't exist
mkdir -p ~/.config ~/.claude ~/.codex ~/.agents

_link() {
    # early return if it exists
    if [ "$(readlink "$2")" = "$1" ]; then
        echo "symlink for $2 already exists"
        return
    fi

    # make a backup if the destination exists and is not a symlink
    if [ -e "$2" ] && [ ! -L "$2" ]; then
        backup="$2.bak-to-delete-$(date +%Y%m%d%H%M%S)"
        mv "$2" "$backup"
        echo "destination existed, made a backup at $backup"
    fi

    # create the symlink
    ln -sfn "$1" "$2"
    echo "symlink for $2 setup"
}

_link ~/.dotfiles/.gitconfig ~/.gitconfig
_link ~/.dotfiles/.hushlogin ~/.hushlogin
_link ~/.dotfiles/fish ~/.config/fish
_link ~/.dotfiles/lazygit ~/.config/lazygit
_link ~/.dotfiles/yazi ~/.config/yazi
_link ~/.dotfiles/nvim ~/.config/nvim
_link ~/.dotfiles/ghostty ~/.config/ghostty
_link ~/.dotfiles/git ~/.config/git
# link skills one by one for claude, as the claude app syncs its own skills into ~/.claude/skills/synced
# codex gets the whole dir linked, as nothing else writes into ~/.agents/skills
mkdir -p ~/.claude/skills
for skill in ~/.dotfiles/skills/*/; do
    _link "${skill%/}" ~/.claude/skills/"$(basename "$skill")"
done
_link ~/.dotfiles/skills ~/.agents/skills
_link ~/.dotfiles/AGENTS.md ~/.claude/CLAUDE.md
_link ~/.dotfiles/AGENTS.md ~/.codex/AGENTS.md

unset -f _link
