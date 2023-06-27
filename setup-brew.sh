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
brew install oven-sh/bun/bun
brew install rustup-init
brew install webp
brew install yarn

# Install casks
brew install 1password
brew install affinity-designer
brew install affinity-photo
brew install affinity-publisher
brew install cleanmymac
brew install --cask docker
brew install figma
brew install firefox
brew install firefox-developer-edition
brew install forklift
brew install google-chrome
brew install google-chrome-canary
brew install imageoptim
brew install insomnia
brew install iterm2
brew install microsoft-teams
brew install mongodb-compass
brew install raycast
brew install safari-technology-preview
brew install screenflow
brew install shapr3d
brew install signal
brew install slack
brew install visual-studio-code

# Install tap formulas
brew install joedrago/repo/avifenc

# Remove outdated versions from the cellar.
brew cleanup
