# Upgrade brew
brew upgrade

# Install CLI tools
brew install awscli
brew install deno
brew install git
brew install hugo
brew install nvm
brew install rustup-init
brew install webp
brew install yarn

# Install casks
brew install 1password
brew install cleanmymac
brew install --cask docker
brew install figma
brew install forklift
brew install google-chrome
brew install hyper
brew install imageoptim
brew install insomnia
brew install keybase
brew install openvpn-connect
brew install raycast
brew install mongodb-compass
brew install screenflow
brew install signal
brew install slack
brew install visual-studio-code

# Add some taps
brew tap joedrago/repo

# Install tap formulas
brew install joedrago/repo/avifenc

# Remove outdated versions from the cellar.
brew cleanup
