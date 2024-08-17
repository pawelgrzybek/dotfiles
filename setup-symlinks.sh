# Create directory if it doesn't exist
[ -d ~/.config ] || mkdir ~/.config

ln -s ~/.dotfiles/alacritty ~/.config/
ln -s ~/.dotfiles/fish ~/.config/
ln -s ~/.dotfiles/helix ~/.config/
ln -s ~/.dotfiles/zellij ~/.config/
ln -s ~/.dotfiles/lazygit ~/.config/
ln -s ~/.dotfiles/yazi ~/.config/

ln -s ~/.dotfiles/.gitconfig ~/.gitconfig


