#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Toggle Dark Mode
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description Toggle Dark mode
# @raycast.author Pawel Grzybek
# @raycast.authorURL https://pawelgrzybek.com

on alfred_script()
	tell application "System Events" to tell appearance preferences to set dark mode to not dark mode
end alfred_script

