#!/usr/bin/env bash
set -euo pipefail

# macOS system defaults — idempotent `defaults write` commands.
# Run with: sh macos/defaults.sh

echo "Applying macOS defaults..."

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Dock: auto-hide
defaults write com.apple.dock autohide -bool true

# Trackpad: enable tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

killall Finder Dock SystemUIServer 2>/dev/null || true
echo "Done. Some changes may require a logout/restart."
