# dotfiles

Before doing anything, make sure you know what are you doing! Settings applied by this repository are very personal, and definitely not suite everyones needs. I suggest to create your own set of dotfiles based on this repo.

0. Install [brew](https://brew.sh/). Follow up by git bro.

```
brew install git
```

1. Clone repository to hidden .dotfile directory in your home directory

```git clone git@github.com:pawelgrzybek/dotfiles.git```

2. Run setup-symlinks.sh.

```source ~/.dotfiles/setup-symlinks.sh```

3. Same with setup-macos.sh file.

```source ~/.dotfiles/setup-osx.sh```

4. Same with setup-brew.sh file (install manually brew first).

```source ~/.dotfiles/setup-osx.sh```

5. VSCode and Alfred settings needs to be symlinked separately.

VSCode:
```
ln -s /Users/pawelgrzybek/.dotfiles/VSCode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s /Users/pawelgrzybek/.dotfiles/VSCode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -s /Users/pawelgrzybek/.dotfiles/VSCode/snippets/ ~/Library/Application\ Support/Code/User/snippets
```

Alfred: use GUI

```
~/.dotfiles
```

6. Don't forget about:

- SSH setup
- download your fav apps from App Store:

  - Affinity Photo
  - Affinity Design
  - Keynote
  - Numbers
  - Pages
  - Reeder
  - Things
  - Tweetbot
  - Xcode

- download VSCode plugins

```
code --install-extension ban.spellright
code --install-extension christian-kohler.npm-intellisense
code --install-extension christian-kohler.path-intellisense
code --install-extension dbaeumer.vscode-eslint
code --install-extension digitalstreamio.mjml-syntax
code --install-extension idleberg.applescript
code --install-extension jkjustjoshing.vscode-text-pastry
code --install-extension mrmlnc.vscode-apache
code --install-extension mrmlnc.vscode-duplicate
code --install-extension mrmlnc.vscode-postcss-sorting
code --install-extension mrmlnc.vscode-scss
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension pawelgrzybek.bimbo-theme
code --install-extension shinnn.stylelint
```
