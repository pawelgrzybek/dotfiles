# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Upgrade brew
brew upgrade

# Add some casks
brew tap aws/tap
brew tap mongodb/brew

# Install CLI tools
brew install awscli
brew install aws-sam-cli
brew install cfn-lint
brew install git
brew install hugo
brew install mongodb-community-shell
brew install nvm
brew install yarn

# Install CLI tools
brew cask install 1password
brew cask install alfred
brew cask install cleanmymac
brew cask install docker
brew cask install figma
brew cask install forklift
brew cask install hyper
brew cask install imageoptim
brew cask install insomnia
brew cask install screenflow
brew cask install skype
brew cask install slack
brew cask install visual-studio-code
brew cask install zoomus

# Remove outdated versions from the cellar.
brew cleanup
