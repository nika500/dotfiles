#!/bin/bash

# Dotfiles installation script using GNU Stow

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}Installing dotfiles...${NC}"

# Check if stow is installed
if ! command -v stow &> /dev/null; then
    echo -e "${RED}Error: GNU Stow is not installed.${NC}"
    echo "Install it with: brew install stow"
    exit 1
fi

# Navigate to dotfiles directory
cd "$(dirname "$0")"

# Stow packages
PACKAGES=(
    "alacritty"
    "zellij"
    "zsh"
)

for package in "${PACKAGES[@]}"; do
    echo -e "${GREEN}Stowing $package...${NC}"
    stow -v "$package"
done

echo -e "${GREEN}✓ Dotfiles installed successfully!${NC}"
echo -e "${BLUE}Note: Restart your terminal for shell changes to take effect.${NC}"
