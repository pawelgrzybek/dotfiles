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
