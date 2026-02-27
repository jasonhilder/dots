# Minimal Dotfiles

A deliberately minimal dotfile configuration. 

## Philosophy

Over the years I have grown tired of tweaking config files, for every component of my desktop. 
This repository contains only the essentials:

- **Desktop Environment**: Gnome 48 with the Pop_Shell extension provides built-in tiling and sensible defaults—no ricing required
- **Configuration**: Only what's necessary for my daily workflow and a few small css changes to square gnomes ui
- **Maintenance**: Simple symlink management and package installation via a single script

## What's Inside

```
.
├── config/
│   ├── fish/          # Fish shell configuration
│   ├── foot/          # Foot terminal configuration
│   ├── gitu/          # Git TUI settings
│   ├── kanata/        # Keyboard remapping
│   ├── gtk3/          # gtk3 css for squared ui
│   ├── gtk4/          # gtk4 css for squared ui
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

- **CLI Tools**: `wget`, `curl`, `fzf`, `fd-find`, `ripgrep`, `tree`, `btop`, `direnv`
- **Development**: `build-essential`, `make`, `bear`, `valgrind`
- **Shell**: `fish`

## Symlinks Created

- `~/.config/fish` → `./config/fish`
- `~/.config/foot` → `./config/foot`
- `~/.config/kanata` → `./config/kanata`
- `~/.config/nvim` → `./config/nvim`
- `~/.config/gitu` → `./config/gitu`
- `~/.config/gtk-3.0/gtk.css` → `./config/gtk3/gtk.css`
- `~/.config/gtk-4.0/gtk.css` → `./config/gtk4/gtk.css`

This setup prioritizes **stability** and **simplicity** over customization, the Gnome Desktop with minimal extensions handles the heavy lifting for tiling and aesthetics.

## Extensions installed
- Pop Shell
- User Themes
- Arc Menu
- Disable workspace switcher

