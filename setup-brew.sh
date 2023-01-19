# Upgrade brew
brew upgrade

# Add some taps
brew tap joedrago/repo
brew tap homebrew/cask-versions

# Install CLI tools
brew install awscli
brew install deno
brew install git
brew install hugo
brew install jq
brew install mongosh
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
brew install google-chrome-canary
brew install --cask httpie
brew install imageoptim
brew install iterm2
brew install mongodb-compass
brew install openvpn-connect
brew install raycast
brew install safari-technology-preview
brew install screenflow
brew install shapr3d
brew install signal
brew install visual-studio-code

# Install tap formulas
brew install joedrago/repo/avifenc

# Remove outdated versions from the cellar.
brew cleanup
