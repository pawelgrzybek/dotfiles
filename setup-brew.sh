# Upgrade brew
brew upgrade

# Add some taps
brew tap joedrago/repo
brew tap homebrew/cask-versions

# Install CLI tools
brew install awscli
brew install deno
brew install fd
brew install fish
brew install git
brew install helix
brew install hugo
brew install lazygit
brew install pnpm
brew install rustup-init
brew install webp
brew install yazi
brew install zellij

# Install casks
brew install 1password
brew install affinity-designer
brew install affinity-photo
brew install alacritty
brew install cleanmymac
brew install --cask docker
brew install figma
brew install firefox
brew install firefox@developer-edition
brew install forklift
brew install google-chrome
brew install google@chrome-canary
brew install imageoptim
brew install insomnia
brew install logi-options+
brew install raycast
brew install safari-technology-preview
brew install screen-studio
brew install signal
brew install slack
brew install tuple
brew install visual-studio-code

# Install tap formulas
brew install joedrago/repo/avifenc

# Remove outdated versions from the cellar.
brew cleanup
