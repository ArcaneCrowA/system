#!/usr/bin/env bash
set -euo pipefail

# First-time machine bootstrap (macOS).
# Installs Homebrew, runs Brewfile, sets up stow, and runs initial config.

echo "==> Installing Homebrew..."
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "==> Running Brewfile..."
brew bundle --file="$HOME/system/Brewfile" --no-lock

echo "==> Linking dotfiles..."
sh "$HOME/system/scripts/link.sh"

echo "==> Applying macOS defaults..."
sh "$HOME/system/macos/defaults.sh"

echo "==> Bootstrap complete. Restart your shell."
