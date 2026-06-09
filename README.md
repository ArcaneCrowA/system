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
│   ├── .gitconfig
│   ├── .vimrc
│   └── .config/
│       ├── fish/
│       │   ├── config.fish
│       │   └── fish_plugins
│       ├── ghostty/
│       │   └── config
│       └── zed/
│           ├── keymap.json
│           ├── settings.json
│           ├── tasks.json
│           ├── AGENTS.md
│           └── snippets/
│
├── languages/
│   ├── go.yml
│   ├── python.yml
│   └── rust.yml
```

## Getting started

```bash
git clone git@github.com:<user>/system.git ~/Developer/system

# Bootstrap everything (Homebrew, Brewfile, dotfiles, defaults)
task bootstrap
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
- **macOS-first** — designed for macOS, with platform-conditional tasks
