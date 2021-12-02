# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Upgrade brew
brew upgrade

# Add some casks
brew tap homebrew/cask-versions
brew tap joedrago/repo
brew tap mongodb/brew

# Install CLI tools
brew install joedrago/repo/avifenc
brew install awscli
brew install git
brew install go
brew install hugo
brew install mongodb-community@5.0
brew install nvm
brew install tunnelblick
brew install webp
brew install yarn

# Install CLI tools
brew install 1password
brew install alfred
brew install cleanmymac
brew install docker
brew install figma
brew install forklift
brew install google-chrome-canary
brew install hyper
brew install imageoptim
brew install insomnia
brew install keybase
brew install screenflow
brew install signal
brew install slack
brew install visual-studio-code

# Remove outdated versions from the cellar.
brew cleanup
