# Dotfiles

My personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Quick Start

1. **Clone this repository:**
   ```bash
   git clone <your-repo-url> ~/dotfiles
   cd ~/dotfiles
   ```

2. **Install GNU Stow (if not installed):**
   ```bash
   brew install stow
   ```

3. **Run the installation script:**
   ```bash
   ./install.sh
   ```

## What's Included

- **alacritty** - Terminal emulator config
- **nvim** - Neovim configuration (LazyVim)
- **zellij** - Terminal multiplexer config
- **zsh** - Shell configuration

See [CONFIGS.md](CONFIGS.md) for a complete list of available configs to add.

## How It Works

GNU Stow creates symlinks from this repo to your home directory:

```
~/dotfiles/alacritty/.config/alacritty/ → ~/.config/alacritty/
~/dotfiles/nvim/.config/nvim/           → ~/.config/nvim/
~/dotfiles/zellij/.config/zellij/       → ~/.config/zellij/
~/dotfiles/zsh/.zshrc                   → ~/.zshrc
```

## Adding New Configs

1. Create a directory for the tool: `mkdir ~/dotfiles/newtool`
2. Recreate the directory structure from `~/`
3. Copy your config files
4. Add to `install.sh`
5. Run: `stow newtool`

## Manual Installation

To install individual configs:

```bash
cd ~/dotfiles
stow alacritty  # Install just alacritty
stow nvim       # Install just nvim
stow zellij     # Install just zellij
stow zsh        # Install just zsh
```

To uninstall:

```bash
stow -D alacritty  # Remove alacritty symlinks
```
