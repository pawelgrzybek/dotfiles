# dotfiles

Before doing anything, make sure you know what are you doing! Settings applied by this repository are very personal, and definitely not suite everyones needs. I suggest to create your own set of dotfiles based on this repo.

1. Install [brew](https://brew.sh/) and download all CLIs & casks.

```
source ~/.dotfiles/setup-brew.sh
```

2. SSH setup

3. Clone this repo to hidden `.dotfile` directory in your home directory.

```
git clone git@github.com:pawelgrzybek/dotfiles.git ~/.dotfile
```

4. Setup macOS.

```
source ~/.dotfiles/setup-osx.sh
```

5. Setup symlinks.

```
source ~/.dotfiles/setup-symlinks.sh
```

6. Download VSCode plugins

```
source ~/.dotfiles/setup-vscode.sh
```

7. Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).

8. ZSH theme copy

```
cp .dotfiles/pawelgrzybek.zsh-theme .oh-my-zsh/custom/themes
```

9. Configure Alfred settings.

Read / write settings to `~/.dotfiles`, enable clipboard (plain text for 7 days) and your personalized theme.

10. Download your fav apps from App Store or independent websites:

- Affinity Photo
- Affinity Design
- Keynote
- Numbers
- Pages
- Palette Master Element
- Reeder
- Things

11. download node and some global yarn stuff

```
nvm install node
```

```
yarn global add vsce
```
