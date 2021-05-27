# dotfiles

Before doing anything, make sure you know what are you doing! Settings applied by this repository are very personal and definitely not for everyone. I suggest to create your own set of dotfiles based on this repo.

1. Install brew and stuff.

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/pawelgrzybek/dotfiles/master/setup-brew.sh)"
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

6. Configure Alfred settings.

- read / write settings to `~/.dotfiles`
- enable clipboard (plain text for 7 days)
- personalized theme

7. Download your fav apps from App Store or independent websites:

- Affinity Photo
- Affinity Design
- Capture One Pro
- Keynote
- Numbers
- Pages
- Palette Master Element
- Reeder

8. download node

```
nvm install node
```
