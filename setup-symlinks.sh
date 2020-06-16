# Create directories if do not exist yet
[ -d ~/Library/Application\ Support/Code/User/ ] || mkdir ~/Library/Application\ Support/Code/User
[ -d ~/Library/Application\ Support/Capture\ One/ ] || mkdir ~/Library/Application\ Support/Capture\ One

# Visual Studio Code
ln -s ~/.dotfiles/VSCode/* ~/Library/Application\ Support/Code/User

# Capture One
ln -s ~/.dotfiles/Capture\ One/* ~/Library/Application\ Support/Capture\ One

# Dotfiles
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.hyper.js ~/.hyper.js

# Initialize new settings
source ~/.zshrc
