# Minimal Dotfiles

A deliberately minimal dotfile configuration. 

## Philosophy

Over the years I have grown tired of tweaking config files, for every component of my desktop. 
This repository contains only the essentials:

- **Desktop Environment**: [COSMIC Desktop](https://system76.com/cosmic) provides built-in tiling, polished UI, and sensible defaults—no ricing required
- **Configuration**: Only what's necessary for my daily workflow
- **Maintenance**: Simple symlink management and package installation via a single script

## What's Inside

```
.
├── config/
│   ├── fish/          # Fish shell configuration
│   ├── gitu/          # Git TUI settings
│   ├── kanata/        # Keyboard remapping
│   └── nvim/          # Neovim setup
└── install.sh         # Automated setup script
```

## Installation

Clone this repository and run the install script:

### Install Options

```bash
# Interactive mode (with confirmations)
./install.sh

# Only create symlinks
./install.sh -l

# Only install packages
./install.sh -i
```

## What Gets Installed

The script installs essential development tools via `apt`:

- **CLI Tools**: `fzf`, `fd-find`, `ripgrep`, `tree`, `btop`, `direnv`
- **Development**: `neovim`, `build-essential`, `make`, `bear`, `valgrind`
- **Shell**: `fish`

## Symlinks Created

- `~/.config/fish` → `./config/fish`
- `~/.config/kanata` → `./config/kanata`
- `~/.config/nvim` → `./config/nvim`
- `~/.config/gitu` → `./config/gitu`

This setup prioritizes **stability** and **simplicity** over customization, COSMIC Desktop handles the heavy lifting for tiling and aesthetics.

---

*Less configuration, more creation.*
