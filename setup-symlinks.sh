# Create directories if do not exist yet
[ -d ~/Library/Application\ Support/Capture\ One/ ] || mkdir ~/Library/Application\ Support/Capture\ One

# Capture One
ln -s ~/.dotfiles/Capture\ One/* ~/Library/Application\ Support/Capture\ One

# Dotfiles
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.alacritty.yml ~/.alacritty.yml
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf

# Initialize new settings
source ~/.zshrc
