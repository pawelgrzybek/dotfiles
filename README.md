# dotfiles

Before doing anything, make sure you know what are you doing! Settings applied by this repository are very personal, and definitely not suite everyones needs. I suggest to create your own set of dotfiles based on this repo.

1. Install [brew](https://brew.sh/).

2. Install git.

`brew install git`

3. Clone this repo to hidden .dotfile directory in your home directory

`git clone git@github.com:pawelgrzybek/dotfiles.git ~/.dotfile`

4. Run setup.

`source ~/.dotfiles/setup-symlinks.sh`

`source ~/.dotfiles/setup-osx.sh`

`source ~/.dotfiles/setup-brew.sh`

5. Symlink VSCode stuff manually.

VSCode:

```
ln -s /Users/pawelgrzybek/.dotfiles/VSCode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s /Users/pawelgrzybek/.dotfiles/VSCode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -s /Users/pawelgrzybek/.dotfiles/VSCode/snippets/ ~/Library/Application\ Support/Code/User/snippets
```

6. Configure Alfred settings.

Alfred: use GUI

```
~/.dotfiles
```

7. Enable Alfred clipboard (plain text for 7 days) and your personalized theme.

8. SSH setup

9. Download your fav apps from App Store or independent websites:

- Affinity Photo
- Affinity Design
- Affinity Publisher
- Keynote
- Numbers
- Pages
- Palette Master Element
- Reeder
- Things

10. download VSCode plugins

```
code --install-extension ban.spellright
code --install-extension christian-kohler.npm-intellisense
code --install-extension christian-kohler.path-intellisense
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension idleberg.applescript
code --install-extension karigari.chat
code --install-extension mrmlnc.vscode-duplicate
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension ms-vsliveshare.vsliveshare-audio
code --install-extension ms-vsliveshare.vsliveshare-pack
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension Orta.vscode-jest
code --install-extension pawelgrzybek.gatito-theme
```

11. download node

```
nvm install node
```
