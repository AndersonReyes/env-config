# Neovim configuration

Minimal Neovim 0.12 configuration using lazy.nvim, Gruvbox, Treesitter,
Telescope, and vim-sleuth.

## External requirements

These programs must be installed outside Neovim:

| Program | Why it is needed |
| --- | --- |
| Neovim 0.12+ | The current Treesitter configuration uses Neovim 0.12 APIs. |
| Git | lazy.nvim clones and updates plugins from Git repositories. |
| tree-sitter-cli 0.26.1+ | nvim-treesitter uses it to generate and install parsers. |
| C compiler | Compiles Treesitter parsers. On macOS, install Xcode Command Line Tools. |
| tar and curl | Download and extract Treesitter parser sources. Included with macOS. |
| ripgrep (`rg`) | Required by Telescope's live text search (`<leader>fg`). |

`fd` is optional but can make Telescope file discovery faster.

### macOS with Homebrew

```sh
brew install neovim tree-sitter-cli ripgrep
```

Optional:

```sh
brew install fd
```

If no C compiler is available, install Apple's developer command-line tools:

```sh
xcode-select --install
```

## First startup

Place this directory at `~/.config/nvim`, then start Neovim:

```sh
nvim
```

lazy.nvim bootstraps itself and installs the configured plugins. Synchronize
plugins and Treesitter parsers with:

```vim
:Lazy sync
:TSUpdate
```

Check the installation with:

```vim
:checkhealth lazy
:checkhealth nvim-treesitter
:checkhealth telescope
```

## Configuration files

- [`init.lua`](init.lua) loads the configuration modules.
- [`lua/config/options.lua`](lua/config/options.lua) contains editor options.
- [`lua/config/keymaps.lua`](lua/config/keymaps.lua) contains general mappings.
- [`lua/config/lazy.lua`](lua/config/lazy.lua) bootstraps lazy.nvim.
- [`lua/plugins/autopairs.lua`](lua/plugins/autopairs.lua) configures automatic
  pairs and brace blocks.
- [`lua/plugins/gruvbox.lua`](lua/plugins/gruvbox.lua) configures the theme.
- [`lua/plugins/sleuth.lua`](lua/plugins/sleuth.lua) configures indentation
  detection.
- [`lua/plugins/telescope.lua`](lua/plugins/telescope.lua) configures search
  and Telescope-specific mappings.
- [`lua/plugins/treesitter.lua`](lua/plugins/treesitter.lua) configures parsers,
  highlighting, and indentation.

Commit `lazy-lock.json` with the rest of the configuration. It records exact
plugin revisions so another machine can reproduce the same plugin versions.

## Reloading configuration

Options and non-plugin key mappings can be reloaded independently:

```vim
:source ~/.config/nvim/lua/config/options.lua
:source ~/.config/nvim/lua/config/keymaps.lua
```

Restart Neovim after changing lazy.nvim plugin specifications. Some plugins
cannot be safely initialized more than once in the same process.
