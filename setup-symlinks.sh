# Create directories if they don't exist
mkdir -p ~/.config ~/.claude

function _link
    # A real file/dir in the way is usually a tool's own scaffolding - fish
    # recreates ~/.config/fish every time it starts, so this cannot be avoided
    # by ordering alone. Move it aside rather than skip, or the symlink never
    # gets created on a fresh machine.
    if test -e $argv[2]; and not test -L $argv[2]
        set --local backup $argv[2].bak.(date +%Y%m%d%H%M%S)
        mv $argv[2] $backup
        echo "moved existing $argv[2] to $backup"
    end

    ln -sfn $argv[1] $argv[2]
    echo "symlink for $argv[2] setup"
end

_link ~/.dotfiles/fish ~/.config/fish
_link ~/.dotfiles/lazygit ~/.config/lazygit
_link ~/.dotfiles/yazi ~/.config/yazi
_link ~/.dotfiles/nvim ~/.config/nvim
_link ~/.dotfiles/ghostty ~/.config/ghostty
_link ~/.dotfiles/git ~/.config/git
_link ~/.dotfiles/claude/commands ~/.claude/commands
_link ~/.dotfiles/claude/skills ~/.claude/skills
_link ~/.dotfiles/claude/settings.json ~/.claude/settings.json
_link ~/.dotfiles/claude/CLAUDE.md ~/.claude/CLAUDE.md
_link ~/.dotfiles/.gitconfig ~/.gitconfig
_link ~/.dotfiles/.hushlogin ~/.hushlogin

functions -e _link
