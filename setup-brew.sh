# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Upgrade brew
brew upgrade

# Add some casks
brew tap joedrago/repo

# Install CLI tools
brew install joedrago/repo/avifenc
brew install awscli
brew install deno
brew install git
brew install hugo
brew install nvm
brew install webp
brew install yarn

# Install CLI tools
brew install 1password
brew install cleanmymac
brew install docker
brew install figma
brew install forklift
brew install google-chrome
brew install hyper
brew install imageoptim
brew install insomnia
brew install kap
brew install keybase
brew install signal
brew install slack
brew install openvpn-connect
brew install raycast
brew install visual-studio-code

# Remove outdated versions from the cellar.
brew cleanup
