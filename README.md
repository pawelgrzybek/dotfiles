# dotfiles

Before doing anything, make sure you know what are you doing! Settings applied by this repository are very personal and definitely not for everyone. I suggest to create your own set of dotfiles based on this repo.

1. Install brew and stuff.

[https://brew.sh](https://brew.sh)

1. Install brew stuff.

```
source ~/.dotfiles/setup-brew.sh
```

2. Download your fav apps from App Store or independent websites:

- Affinity Photo
- Affinity Design
- Capture One Pro
- Keynote
- Numbers
- Pages
- Palette Master Element
- Reeder

3. SSH setup
4. Clone this repo to hidden `.dotfile` directory in your home directory.

```
git clone git@github.com:pawelgrzybek/dotfiles.git ~/.dotfile
```

5. Setup macOS.

```
source ~/.dotfiles/setup-macos.sh
```

6. Setup symlinks.

```
source ~/.dotfiles/setup-symlinks.sh
```

7. Configure Raycast from `.rayconfig` file.

8. download node

```
nvm install node
```
