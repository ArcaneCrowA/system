#!/usr/bin/env bash
set -euo pipefail

# First-time machine bootstrap (macOS).
# Installs Homebrew, runs Brewfile, sets up stow, and runs initial config.

DOTFILES="$(cd "$(dirname "$0")/.." && pwd)"

echo "==> Installing Homebrew..."
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "==> Running Brewfile..."
brew bundle --file="$DOTFILES/Brewfile" --no-lock

echo "==> Linking dotfiles..."
sh "$DOTFILES/scripts/link.sh"

echo "==> Applying macOS defaults..."
sh "$DOTFILES/macos/defaults.sh"

echo "==> Bootstrap complete. Restart your shell."
