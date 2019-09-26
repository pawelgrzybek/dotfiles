# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Upgrade brew
brew upgrade

# Add some casks
brew tap homebrew/cask-versions
# brew tap aws/tap

# Install CLI tools
# brew install aws-sam-cli
# brew install awscli
# brew install cfn-lint
brew install cowsay
brew install git
brew install hugo
brew install nvm
brew install tree
brew install yarn

# Install CLI tools
brew cask install 1password
brew cask install alfred
brew cask install capture-one
brew cask install cleanmymac
brew cask install docker
brew cask install figma
brew cask install forklift
brew cask install google-chrome
brew cask install hyper
brew cask install imagealpha
brew cask install imageoptim
brew cask install insomnia
brew cask install mongodb-compass
brew cask install screenflow
brew cask install skype
brew cask install slack
brew cask install visual-studio-code
brew cask install zoomus

# Remove outdated versions from the cellar.
brew cleanup
