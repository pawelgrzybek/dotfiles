# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Upgrade brew
brew upgrade

# Add some casks
brew tap aws/tap

# Install CLI tools
brew install awscli
brew install aws-sam-cli
brew install cfn-lint
brew install git
brew install hugo
brew install nvm
brew install yarn

# Install CLI tools
brew install 1password
brew install alfred
brew install cleanmymac
brew install docker
brew install figma
brew install forklift
brew install hyper
brew install imageoptim
brew install insomnia
brew install screenflow
brew install skype
brew install slack
brew install visual-studio-code
brew install zoom

# Remove outdated versions from the cellar.
brew cleanup
