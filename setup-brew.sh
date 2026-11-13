#!/bin/zsh

# Upgrade brew
brew upgrade

# Install CLI tools
brew install \
    aws-cdk \
    awscli \
    cloudflared \
    difftastic \
    fd \
    fish \
    gh \
    git \
    go \
    hugo \
    imageoptim-cli \
    lazygit \
    libavif \
    mole \
    neovim \
    node \
    ripgrep \
    tree-sitter-cli \
    webp \
    yazi

# Install casks
brew install --cask \
    affinity \
    bruno \
    claude-code \
    codex \
    copilot-cli \
    docker-desktop \
    figma \
    firefox \
    firefox@developer-edition \
    forklift \
    ghostty \
    google-chrome \
    google-chrome@canary \
    imageoptim \
    netnewswire \
    openlogi
    raycast \
    safari-technology-preview \
    screen-studio \
    signal \
    tableplus

# Remove outdated versions from the cellar.
brew cleanup
