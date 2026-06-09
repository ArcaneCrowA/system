#!/usr/bin/env bash
set -euo pipefail

# Symlink dotfiles to $HOME using stow.
# Usage: sh scripts/link.sh

DOTFILES="$(cd "$(dirname "$0")/.." && pwd)"

if ! command -v stow &> /dev/null; then
  echo "stow not found. Install it: brew install stow"
  exit 1
fi

echo "Stowing dotfiles into $HOME..."
cd "$DOTFILES"

# Clean up orphaned symlinks from previous stow layouts
stow -D --no-folding -t "$HOME" dotfiles 2>/dev/null || true

# Remove any leftover symlinks not recognized by stow
find dotfiles \( -type f -o -type l \) | while IFS= read -r file; do
  target="$HOME/${file#dotfiles/}"
  if [[ -L "$target" ]]; then
    rm "$target"
  fi
done

stow --no-folding -t "$HOME" dotfiles

echo "Done."
