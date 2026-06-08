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

# Remove old symlinks if stow doesn't recognize them
stow -D --no-folding -t "$HOME" dotfiles 2>/dev/null || true
# Force-remove any leftover targets not recognized by stow
find dotfiles -type f,l | while IFS= read -r file; do
  target="$HOME/${file#dotfiles/}"
  # Remove symlinks and regular files (stow will re-create)
  if [[ -L "$target" ]] || [[ -f "$target" ]]; then
    rm "$target"
  fi
done

stow --no-folding -t "$HOME" dotfiles

echo "Done."
