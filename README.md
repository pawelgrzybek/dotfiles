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
code --install-extension ban.spellright christian-kohler.npm-intellisense christian-kohler.path-intellisense dbaeumer.vscode-eslint digitalstreamio.mjml-syntax idleberg.applescript jkjustjoshing.vscode-text-pastry mrmlnc.vscode-apache mrmlnc.vscode-duplicate mrmlnc.vscode-postcss-sorting mrmlnc.vscode-scss msjsdiag.debugger-for-chrome pawelgrzybek.bimbo-theme shinnn.stylelint
```






