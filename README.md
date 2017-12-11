# dotfiles

Before doing anything, make sure you know what are you doing! Settings applied by this repository are very personal, and definitely not suite everyones needs. I suggest to create your own set of dotfiles based on this repo.

1. Clone repository to hidden .dotfile directory in your home directory

```git clone git@github.com:pawelgrzybek/dotfiles.git```

2. Run setup-symlinks.sh.

```source ~/.dotfiles/setup-symlinks.sh```

3. Same with setup-macos.sh file.

```source ~/.dotfiles/setup-osx.sh```

4. VSCode, iTerm and Alfred settings needs to be symlinked separately.

VSCode:
```
ln -s ~/.dotfiles/Code/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/.dotfiles/Code/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -s ~/.dotfiles/Code/snippets/ ~/Library/Application\ Support/Code/User/snippets
```

iTerm: use GUI

```
/Users/pawelgrzybek/.dotfiles/iTerm
```

Alfred: use GUI

```
~/.dotfiles
```

5. Don't forget about:

- install brew
- ssh setup
- download your fav apps from brew:

```
brew cask install 1password alfred capture-one cleanmymac forklift google-chrome caskroom/versions/google-chrome-canary imageoptim safari-technology-preview screenflow sketch tower visual-studio-code iterm2
```

- download VSCode plugins
    - SirTori.indenticator-0.4.2/
    - christian-kohler.npm-intellisense-1.3.0/
    - christian-kohler.path-intellisense-1.4.2/
    - dbaeumer.vscode-eslint-1.4.3/
    - digitalstreamio.mjml-syntax-0.0.1/
    - idleberg.applescript-0.9.2/
    - jasonnutter.search-node-modules-1.2.0/
    - mrmlnc.vscode-duplicate-1.2.0/
    - mrmlnc.vscode-postcss-sorting-3.0.1/
    - mrmlnc.vscode-scss-0.6.2/
    - ms-vscode.csharp-1.13.1/
    - pawelgrzybek.bimbo-theme-0.4.1/
    - shinnn.stylelint-0.31.0/
    - swyphcosmo.spellchecker-1.2.13/
    - wix.vscode-import-cost-2.5.1/

- download your fav apps from independently:

    - Affinity
    - Keynote
    - Numbers
    - Pages
    - Reeder
    - Things3
    - Tweetbot
    - Xcode




