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
stow -R --no-folding -t "$HOME" dotfiles

echo "Done."
