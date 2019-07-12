# dotfiles

Before doing anything, make sure you know what are you doing! Settings applied by this repository are very personal, and definitely not suite everyones needs. I suggest to create your own set of dotfiles based on this repo.

1. Install [brew](https://brew.sh/).

2. Install git.

```
brew install git
```

3. Clone this repo to hidden .dotfile directory in your home directory

```
git clone git@github.com:pawelgrzybek/dotfiles.git ~/.dotfile
```

4. Run setup.

```
source ~/.dotfiles/setup-symlinks.sh
```

```
source ~/.dotfiles/setup-osx.sh
```

```
source ~/.dotfiles/setup-brew.sh
```

5. Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).

6. Symlink VSCode stuff manually.

VSCode:

```
ln -s ~/.dotfiles/VSCode/* ~/Library/Application\ Support/Code/User/
```

7. Configure Alfred settings.

Alfred: use GUI

```
~/.dotfiles
```

8. Enable Alfred clipboard (plain text for 7 days) and your personalized theme.

9. SSH setup

10. Download your fav apps from App Store or independent websites:

- Affinity Photo
- Affinity Design
- Keynote
- Numbers
- Pages
- Palette Master Element
- Reeder
- Things

11. download VSCode plugins

```
code --install-extension ban.spellright
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension idleberg.applescript
code --install-extension karigari.chat
code --install-extension mrmlnc.vscode-duplicate
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension ms-vsliveshare.vsliveshare-audio
code --install-extension ms-vsliveshare.vsliveshare-pack
code --install-extension pawelgrzybek.gatito-theme
```

12. download node and some global yarn stuff

```
nvm install node
```

```
yarn global add vsce
```

13. Capture One Pro config symlinks

```
ln -s ~/.dotfiles/Capture\ One/* ~/Library/Application\ Support/Capture\ One/
```

14. ZSH theme copy

```
cp .dotfiles/pawelgrzybek.zsh-theme .oh-my-zsh/custom/themes
```
