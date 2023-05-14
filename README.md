# dotfiles

Before doing anything, make sure you know what are you doing! Settings applied by this repository are very personal and definitely not for everyone. I suggest creating your own set of dotfiles based on this repo.

1. Install brew and stuff.

[https://brew.sh](https://brew.sh)

2. Install brew stuff.

```
source ~/.dotfiles/setup-brew.sh
```

3. Download your fav apps from App Store or independent websites:

- Capture One Pro
- Keynote
- Numbers
- Pages
- FoodNoms
- Overcast
- Reeder

4. SSH setup
5. Clone this repo to hidden `.dotfile` directory in your home directory.

```
git clone git@github.com:pawelgrzybek/dotfiles.git ~/.dotfile
```

6. Setup macOS.

```
source ~/.dotfiles/setup-macos.sh
```

7. Setup symlinks.

```
source ~/.dotfiles/setup-symlinks.sh
```

8. download node

```
nvm install node
```
