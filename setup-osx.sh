# Finder: show all filename extensions
# http://www.defaults-write.com/display-the-file-extensions-in-finder/
# Revert to the default
# defaults write NSGlobalDomain AppleShowAllExtensions -bool false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true


# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true


# Disable the extension change warning in OS X Finder
# http://www.defaults-write.com/disable-the-extension-change-warning-in-os-x-finder/
# Revert to the default
# defaults write com.apple.finder FXEnableExtensionChangeWarning -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false


# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist


# Use list view in all Finder windows by default
# http://www.defaults-write.com/change-default-view-style-in-os-x-finder/
# Revert to the default
# defaults write com.apple.Finder FXPreferredViewStyle icnv
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"


# Disable the warning before emptying the Trash
# http://www.defaults-write.com/disable-the-warning-before-emptying-the-trash/
# Revert to the default
# defaults write com.apple.finder WarnOnEmptyTrash -bool true
defaults write com.apple.finder WarnOnEmptyTrash -bool false


# Set the icon size of Dock items to 44 pixels
defaults write com.apple.dock tilesize -int 44


# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true


# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true


# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1


# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true


# Disable Dashboard as a space in Mission Control
# http://www.defaults-write.com/disable-dashboard-as-a-space-in-mission-control/
# Revert to the default
# defaults write com.apple.dock dashboard-in-overlay -bool false
defaults write com.apple.dock dashboard-in-overlay -bool true


# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false


# Remove the Dock Auto-Hide & Show Delay
# http://www.defaults-write.com/remove-the-dock-auto-hide-show-delay/
# Revert to the default
# defaults delete com.apple.Dock autohide-delay
defaults write com.apple.dock autohide-delay -float 0

# Reduce the animation when hiding/showing the Dock to 0.5s
defaults write com.apple.dock autohide-time-modifier -float 0.5


# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true


for app in "Dock" "Finder"; do
  killall "${app}" > /dev/null 2>&1
done


echo "Done. Note that some of these changes require a logout/restart to take effect."
