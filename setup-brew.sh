#!/bin/zsh

# Upgrade brew
brew upgrade

# Install CLI tools
brew install \
    awscli \
    difftastic \
    fd \
    fish \
    gh \
    git \
    go \
    hugo \
    jq \
    lazygit \
    libavif \
    mole \
    neovim \
    node \
    protobuf \
    ripgrep \
    tree-sitter-cli \
    webp \
    yazi

# Install casks
brew install --cask \
    affinity \
    bruno \
    claude-code \
    docker-desktop \
    figma \
    firefox \
    firefox@developer-edition \
    forklift \
    ghostty \
    google-chrome \
    google-chrome@canary \
    handy \
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
