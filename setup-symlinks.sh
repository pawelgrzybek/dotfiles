# Create directory if it doesn't exist
[ -d ~/.config ] || mkdir ~/.config

function _link
    if test -e $argv[2]
        echo "Hey $argv[2] already exists"
    else
        ln -s $argv[1] $argv[2]
        echo "symlink for $argv[2] setup"
    end
end

_link ~/.dotfiles/fish ~/.config/fish
_link ~/.dotfiles/lazygit ~/.config/lazygit
_link ~/.dotfiles/yazi ~/.config/yazi
_link ~/.dotfiles/nvim ~/.config/nvim
_link ~/.dotfiles/ghostty ~/.config/ghostty
_link ~/.dotfiles/claude/commands ~/.claude/commands
_link ~/.dotfiles/claude/skills ~/.claude/skills
_link ~/.dotfiles/claude/settings.json ~/.claude/settings.json
_link ~/.dotfiles/claude/CLAUDE.md ~/.claude/CLAUDE.md
_link ~/.dotfiles/.gitconfig ~/.gitconfig
_link ~/.dotfiles/.hushlogin ~/.hushlogin

functions -e _link
