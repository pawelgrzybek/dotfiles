# Create directory if it doesn't exist
[ -d ~/.config ] || mkdir ~/.config

ln -s ~/.dotfiles/fish ~/.config/
ln -s ~/.dotfiles/zellij ~/.config/
ln -s ~/.dotfiles/lazygit ~/.config/
ln -s ~/.dotfiles/yazi ~/.config/
ln -s ~/.dotfiles/nvim ~/.config/
ln -s ~/.dotfiles/ghostty ~/.config/

ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.hushogin ~/.hushlogin


