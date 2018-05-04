# dotfiles

Before doing anything, make sure you know what are you doing! Settings applied by this repository are very personal, and definitely not suite everyones needs. I suggest to create your own set of dotfiles based on this repo.

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

- ssh setup
- download your fav apps that are not available through brew cask:

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

  - ban.spellright-2.3.3/
  - christian-kohler.npm-intellisense-1.3.0/
  - christian-kohler.path-intellisense-1.4.2/
  - dbaeumer.vscode-eslint-1.4.8/
  - digitalstreamio.mjml-syntax-0.0.1/
  - idleberg.applescript-0.10.0/
  - jkjustjoshing.vscode-text-pastry-1.2.0/
  - mrmlnc.vscode-apache-1.1.1/
  - mrmlnc.vscode-duplicate-1.2.1/
  - mrmlnc.vscode-postcss-sorting-3.0.1/
  - mrmlnc.vscode-scss-0.6.2/
  - ms-vscode.csharp-1.13.1/
  - msjsdiag.debugger-for-chrome-4.3.0/
  - pawelgrzybek.bimbo-theme-0.4.6/
  - shinnn.stylelint-0.36.0/






