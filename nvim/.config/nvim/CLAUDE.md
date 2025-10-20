# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a LazyVim-based Neovim configuration. LazyVim is a Neovim setup powered by lazy.nvim that provides a pre-configured development environment.

## Architecture

The configuration follows LazyVim's standard structure:

- **Entry Point**: `init.lua` bootstraps LazyVim by loading `lua/config/lazy.lua`
- **Plugin Management**: All plugins are managed through lazy.nvim specs in `lua/plugins/`
- **Configuration Files**:
  - `lua/config/options.lua`: Custom Neovim options (loaded before plugins)
  - `lua/config/keymaps.lua`: Custom keymaps (loaded on VeryLazy event)
  - `lua/config/autocmds.lua`: Custom autocommands
  - `lua/config/lazy.lua`: LazyVim setup and extra imports

## Plugin Customization Patterns

Plugins in `lua/plugins/` follow these patterns:

1. **Adding new plugins**: Return a table with plugin specs
2. **Modifying LazyVim plugins**: Override with same plugin name
3. **Disabling plugins**: Set `enabled = false`
4. **Extending plugin options**: Use `opts` function to merge with defaults

Example patterns from `lua/plugins/example.lua`:
- Add plugins: `{ "plugin/name" }`
- Override colorscheme: Configure LazyVim opts
- Modify plugin config: Use opts table or function
- Add LSP servers: Configure nvim-lspconfig servers table
- Setup Mason tools: Add to ensure_installed

## Active Configuration

### LazyVim Extras
Currently loaded extras (from `lazyvim.json` and `lua/config/lazy.lua`):
- Coding: mini-surround
- Languages: Go, Markdown, YAML, TypeScript, JSON, Tailwind, Python
- Linting: ESLint
- Formatting: Prettier
- UI: mini-hipatterns

### Custom Settings
- Colorscheme: Catppuccin (configured in `lua/plugins/colorscheme.lua`)
- Animations disabled: `vim.g.snacks_animate = false`
- Rust support: `vim.g.lazyvim_rust_diagnostics = "rust-analyzer"`
- Winbar shows: `%=%m %f`

## Development Commands

### Code Formatting
- **Lua files**: Uses stylua with 2-space indentation (configured in `stylua.toml`)
- Format current file: `<leader>cf` (LazyVim default)

### Common LazyVim Commands
- `:Lazy` - Open lazy.nvim UI to manage plugins
- `:LazyExtras` - Browse and enable/disable LazyVim extras
- `:Mason` - Manage LSP servers, formatters, and linters

### Navigation
- `<leader>fp` - Find plugin files (if configured)
- `<leader>cs` - Symbols outline (if symbols-outline.nvim is enabled)

## Adding New Customizations

1. **New Plugin**: Create a new file in `lua/plugins/` or add to existing file
2. **Override Behavior**: Use the same plugin name as LazyVim's spec
3. **Custom Options**: Add to `lua/config/options.lua`
4. **Custom Keymaps**: Add to `lua/config/keymaps.lua`

## Important Notes

- The `lua/plugins/example.lua` file is disabled (`if true then return {} end`) but contains comprehensive examples
- When modifying plugins, check LazyVim's defaults first
- Plugin specs are automatically loaded from `lua/plugins/` directory
- LazyVim updates are tracked in `lazy-lock.json`