# dotfiles

Before doing anything, make sure you know what you are doing! The settings applied by this repository are very personal and definitely not for everyone. I suggest creating your own set of dotfiles based on this repository.

1. Install [brew](https://brew.sh) and stuff and follow the post-installection instructions.

2. Clone this repo to the hidden `.dotfile` directory in your home directory (`git` comes with brew).

```
git clone https://github.com/pawelgrzybek/dotfiles.git ~/.dotfile
```

3. Install brew stuff.

```
source ~/.dotfiles/setup-brew.sh
```

4. Download your fav apps from App Store or independent websites:

- Capture One Pro ([https://www.captureone.com](https://www.captureone.com))
- Keynote (App Store)
- Ivory (App Store)
- Numbers (App Store)
- Pages (App Store)
- FoodNoms (App Store)
- Overcast (App Store)
- Reeder (App Store)

5. SSH setup

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
mkdir ~/.nvm && nvm install node
```
