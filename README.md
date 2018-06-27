# dotfiles

Before doing anything, make sure you know what are you doing! Settings applied by this repository are very personal, and definitely not suite everyones needs. I suggest to create your own set of dotfiles based on this repo.

1. Install [brew](https://brew.sh/).

2. Install git.

```brew install git```

3. Clone repository to hidden .dotfile directory in your home directory

```git clone git@github.com:pawelgrzybek/dotfiles.git ~/.dotfile```

4. Run setup-symlinks.sh.

```source ~/.dotfiles/setup-symlinks.sh```

5. Same with setup-macos.sh file.

```source ~/.dotfiles/setup-osx.sh```

6. Same with setup-brew.sh file.

```source ~/.dotfiles/setup-osx.sh```

7. Symlink VSCode stuff.

VSCode:
```
ln -s /Users/pawelgrzybek/.dotfiles/VSCode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s /Users/pawelgrzybek/.dotfiles/VSCode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -s /Users/pawelgrzybek/.dotfiles/VSCode/snippets/ ~/Library/Application\ Support/Code/User/snippets
```

8. Configure Alfred settings.

Alfred: use GUI

```
~/.dotfiles
```

9. Enable Alfred clipboard (plain text for 7 days) and your personalized theme.

10. Don't forget about:

11. SSH setup

12. Download your fav apps from App Store:

  - Affinity Photo
  - Affinity Design
  - Keynote
  - Numbers
  - Pages
  - Reeder
  - Things
  - Tweetbot
  - Xcode

13. download VSCode plugins

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
