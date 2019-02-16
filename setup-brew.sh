# Upgrade brew
brew upgrade

# Add some casks
brew tap homebrew/cask-versions

# Install CLI tools
brew install bash-completion
brew install cowsay
brew install git
brew install hugo
brew install nvm
brew install yarn
brew install youtube-dl

# Install CLI tools
brew cask install 1password
brew cask install alfred
brew cask install capture-one
brew cask install cleanmymac
brew cask install forklift
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install hyper
brew cask install imagealpha
brew cask install imageoptim
brew cask install insomnia
brew cask install screenflow
brew cask install sketch
brew cask install slack
brew cask install tunnelblick
brew cask install visual-studio-code
brew cask install zoomus

# Remove outdated versions from the cellar.
brew cleanup
