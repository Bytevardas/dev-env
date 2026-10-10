# Dev Environment Cheatsheet

## Tmux

Prefix: `C-a` (Ctrl+a, then release, then press next key)

### Sessions
| Key | Action |
|-----|--------|
| `Ctrl+f` (in nvim) | Fuzzy-find project, create/switch session |
| `C-a f` | Same, from anywhere in tmux |
| `C-a s` | List sessions |
| `C-a w` | List sessions + windows |
| `C-a (` | Previous session |
| `C-a )` | Next session |
| `C-a d` | Detach from tmux |
| `C-a :kill-session` | Kill current session |
| `x` (in session list) | Kill selected session |

### Windows
| Key | Action |
|-----|--------|
| `C-a c` | New window |
| `C-a n` | Next window |
| `C-a p` | Previous window |
| `C-a 1-9` | Jump to window by number |
| `C-a &` | Kill current window |

### Panes
| Key | Action |
|-----|--------|
| `C-a %` | Split vertical |
| `C-a "` | Split horizontal |
| `C-a h/j/k/l` | Navigate panes |
| `C-a x` | Kill current pane |

### Copy Mode
| Key | Action |
|-----|--------|
| `C-a [` | Enter copy mode (vi keys) |
| `v` | Start selection |
| `y` | Yank selection to clipboard |
| `q` | Exit copy mode |

### Config
| Key | Action |
|-----|--------|
| `C-a r` | Reload tmux config |

---

## Neovim

Leader: `Space`

### Navigation
| Key | Action |
|-----|--------|
| `Space pv` | Open file explorer (netrw) |
| `Space pf` | Find files (telescope) |
| `Ctrl+p` | Find git files (telescope) |
| `Space ps` | Grep string (telescope) |
| `Space pws` | Grep word under cursor |
| `Space vh` | Help tags |

### Harpoon (Quick File Marks)
| Key | Action |
|-----|--------|
| `Space a` | Add file to harpoon |
| `Ctrl+e` | Toggle harpoon menu |
| `Ctrl+h/j/k/l` | Jump to mark 1/2/3/4 |
| `Ctrl+Shift+P` | Previous harpoon mark |
| `Ctrl+Shift+N` | Next harpoon mark |

### Editing
| Key | Action |
|-----|--------|
| `J/K` (visual) | Move selected lines down/up |
| `J` (normal) | Join lines, keep cursor position |
| `Space p` (visual) | Paste without losing register |
| `Space y` | Yank to system clipboard |
| `Space Y` | Yank line to system clipboard |
| `Space d` | Delete to void register |
| `Space s` | Search & replace word under cursor |
| `Space x` | Make current file executable |
| `Space Space` | Source current file |

### Scrolling
| Key | Action |
|-----|--------|
| `Ctrl+d` | Half page down (centered) |
| `Ctrl+u` | Half page up (centered) |
| `n/N` | Next/prev search match (centered) |

### LSP
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `K` | Hover info |
| `Space vws` | Workspace symbols |
| `Space vd` | Diagnostics float |
| `Space vca` | Code actions |
| `Space vrr` | References |
| `Space vrn` | Rename |
| `Ctrl+h` (insert) | Signature help |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `Space zig` | Restart LSP |

### Formatting
| Key | Action |
|-----|--------|
| `Space f` | Format file/selection |
| (automatic) | Format on save |

### Git (Fugitive)
| Key | Action |
|-----|--------|
| `Space gs` | Git status |
| `Space p` (fugitive) | Git push |
| `Space P` (fugitive) | Git pull --rebase |
| `Space t` (fugitive) | Git push -u origin ... |
| `gu` | Diffget from left (merge) |
| `gh` | Diffget from right (merge) |

### Diagnostics (Trouble)
| Key | Action |
|-----|--------|
| `Space tt` | Toggle trouble diagnostics list |
| `[t` | Previous trouble item |
| `]t` | Next trouble item |

### Utilities
| Key | Action |
|-----|--------|
| `Space u` | Toggle undo tree |
| `Space zz` | Zen mode (with line numbers) |
| `Space zZ` | Zen mode (minimal, no numbers) |
| `Q` | Disabled (no accidental Ex mode) |
| `Ctrl+c` (insert) | Escape |

### Go Error Snippets
| Key | Action |
|-----|--------|
| `Space ee` | `if err != nil { return err }` |
| `Space ea` | `assert.NoError(err, "")` |
| `Space ef` | `if err != nil { log.Fatalf(...) }` |
| `Space el` | `if err != nil { .logger.Error(...) }` |

### LuaSnip
| Key | Action |
|-----|--------|
| `Ctrl+s e` (insert) | Expand snippet |
| `Ctrl+s ;` | Jump forward in snippet |
| `Ctrl+s ,` | Jump backward in snippet |
| `Ctrl+E` | Cycle snippet choices |

### Markdown Preview (Peek)
| `:PeekOpen` | Open markdown preview |
| `:PeekClose` | Close markdown preview |
