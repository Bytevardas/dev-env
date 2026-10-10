# dev-env

## Setup

```bash
# Install everything (essentials first, then fzf, deno, neovim, tmux)
./run

# Copy configs to system locations
./bootstrap
```

`./run neovim` runs only the scripts whose name matches. `./run --dry` previews.

Open neovim: lazy.nvim installs the plugin versions pinned in `lazy-lock.json`, Mason installs LSP servers and formatters, and nvim-treesitter builds its parsers (needs the `tree-sitter` CLI, installed by `./run`).

## What's in here

- **Essentials** — brew, git, gh, nvm + Node.js LTS, goenv + Go (latest stable), docker + docker-compose + colima, pnpm, postgresql@17, python, ghostty, arc
- **Neovim** — LSP (Go, TypeScript, Rust, Zig, Lua), format-on-save, telescope, harpoon, treesitter, gruvbox
- **Tmux** — C-a prefix, vi copy mode, project sessionizer via C-a f
- **Shell** — aliases and zsh profile (homebrew, ~/.local/bin, nvm, goenv, postgresql PATH)

## Updating configs

Edit files in the repo, then run `./bootstrap` to push changes to system locations.

`./bootstrap --dry` to preview without copying.

## Updating plugins

Plugin versions are pinned by `.config/nvim/lazy-lock.json`. After `:Lazy update`, copy `~/.config/nvim/lazy-lock.json` back into the repo and commit it. `:Lazy restore` returns to the pinned versions.
