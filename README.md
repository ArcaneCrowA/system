# system

Personal environment configuration — dotfiles, machine setup, and tooling automation.

This repository is the single source of truth for my development environment. It is organized by concern so each config file stays small, discoverable, and reusable across macOS/Linux machines.

## Structure

```
system/
├── Taskfile.yml          # Top-level orchestration (bootstrap, install, link, update)
├── Brewfile              # macOS Homebrew packages and casks
│
├── shell/                # Shell configuration
│   ├── .zshrc
│   ├── .bashrc
│   └── aliases.sh        # Shared aliases across shells
│
├── git/                  # Git configuration
│   ├── .gitconfig
│   └── .gitignore_global
│
├── editors/              # Editor / IDE settings
│   └── zed/              # Zed editor settings.json, keymap.json, etc.
│
├── languages/            # Language-specific tooling installers & linters
│   ├── go.yml            # Go binaries and tooling
│   ├── rust.yml          # Rust toolchain (rustup, cargo-install)
│   ├── node.yml          # Node.js version manager + global packages
│   └── python.yml        # Python tooling (pipx, poetry, etc.)
│
├── terminal/             # Terminal emulator configs
│   ├── wezterm/
│   └── alacritty/
│
├── macos/                # macOS-specific settings
│   └── defaults.sh       # System defaults via `defaults write`
│
├── scripts/              # Utility scripts
│   ├── bootstrap.sh      # First-time machine setup (brew, stow, etc.)
│   └── link.sh           # Symlink dotfiles into $HOME
│
└── linux/                # Linux-specific settings (when applicable)
    └── apt.sh            # Apt packages
```

## Getting started

```bash
# Clone into $HOME
git clone <url> ~/system

# Bootstrap a new machine (macOS)
cd ~/system && task macos:bootstrap

# Symlink configs into $HOME
task link

# Install language-specific tooling
task go:install
task rust:install
```

## How to use

### Taskfile orchestration

The top-level `Taskfile.yml` provides named tasks. Each subdirectory can also contain its own `Taskfile.yml` or be called via `task <namespace>:<task>`.

```bash
task                      # Print available tasks
task link                 # Symlink config files
task go:install           # Install Go tooling
task update               # Update everything
```

### Symlinks (dotfiles)

Config files live in this repo and are symlinked into `$HOME` so the source of truth stays here. A `link.sh` script or `stow` can manage this.

```bash
# Example: symlink git configs
ln -sf ~/system/git/.gitconfig ~/.gitconfig
```

### Machine-specific overrides

For secrets or per-machine differences, append `.local` to any config file (e.g. `.gitconfig.local`, `.zshrc.local`). The main config sources these if they exist — they are not committed to the repo.

## Recipes

| Task | Command |
|---|---|
| Show all tasks | `task` |
| Install Go tools | `task go:install` |
| Install Rust tools | `task rust:install` |
| Symlink everything | `task link` |
| macOS defaults | `task macos:defaults` |
| Brew bundle | `brew bundle --file=Brewfile` |

## Principles

- **Declarative over imperative** — configs are idempotent where possible.
- **Idempotent tasks** — running the same install twice should be safe.
- **No secrets in the repo** — use `.local` overrides or environment variables for tokens.
- **Portable where it makes sense** — prefer configs that work on both macOS and Linux.
- **Minimal surprises** — every file has a single, clear purpose.
