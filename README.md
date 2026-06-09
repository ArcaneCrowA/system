# system

Personal dotfiles and machine setup, managed with [stow](https://www.gnu.org/software/stow/) and [Task](https://taskfile.dev).

## Structure

```
system/
├── Taskfile.yml
├── Brewfile
├── .gitignore
│
├── dotfiles/                            # Stow package — mirrors $HOME
│   ├── .zshrc
│   ├── .gitconfig
│   └── .config/
│       ├── fish/
│       │   ├── config.fish
│       │   └── fish_plugins
│       ├── ghostty/
│       │   └── config
│       └── zed/
│           ├── keymap.json
│           └── settings.json
│
├── languages/
│   ├── go.yml
│   ├── python.yml
│   └── rust.yml
│
├── macos/
│   └── defaults.sh
│
├── nixos/
│   ├── configuration.nix
│   └── hardware-configuration.nix
│
└── scripts/
    ├── bootstrap-macos.sh
    └── link.sh
```

## Getting started

```bash
git clone git@github.com:<user>/system.git ~/Developer/system

# Auto-detect OS and bootstrap
task bootstrap

# Or run platform-specific tasks
#   task macos:bootstrap    (macOS)
#   task nixos:link         (NixOS — symlink /etc/nixos)
```

## Usage

```bash
task              # List all tasks
task link         # Symlink dotfiles into $HOME via stow
task go:install   # Install Go tooling
task update       # Update all language tooling
```

## How it works

`dotfiles/` mirrors `$HOME` structure exactly. `task link` runs `stow --no-folding -t ~ dotfiles`, creating symlinks for every file into your home directory. Editing either path edits the same file.

## Secrets and per-machine overrides

Use `.local` files (gitignored by `*.local`). Example:

```bash
# ~/.config/fish/config.fish.local (not committed)
set -gx DEEPSEEK_API_KEY sk-...
```

The main config sources the `.local` file if it exists.

## Principles

- **Single source of truth** — every config lives in this repo
- **Idempotent** — `task link` is safe to re-run any time
- **No secrets** — `.local` files for API keys and machine-specific settings
- **Portable** — macOS-first, Linux-ready via platform-conditional tasks
