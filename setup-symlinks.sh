# Create directories if do not exist yet
[ -d ~/Library/Application\ Support/Capture\ One/ ] || mkdir ~/Library/Application\ Support/Capture\ One

# Capture One
ln -s ~/.dotfiles/Capture\ One/* ~/Library/Application\ Support/Capture\ One

# Dotfiles
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.hushlogin ~/.hushlogin

# Initialize new settings
source ~/.zshrc
