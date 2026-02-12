# Keymaps

Leader key: `Space`

## File/Search

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file tree (`nvim-tree`) |
| `<leader>sf` | Find files |
| `<leader>sg` | Search by grep |
| `<leader>sw` | Search word under cursor |
| `<leader>sd` | Search diagnostics |
| `<leader>/` | Search in current buffer |
| `<leader><leader>` | Switch buffers |

## Find/Replace (Spectre)

| Key | Action |
|-----|--------|
| `<leader>sR` | Open project search/replace UI |
| `<leader>sW` | Search current word in project |
| `<leader>sp` | Search/replace in current file |
| `<leader>sR` (visual) | Search selected text |

## LSP / Code Navigation

| Key | Action |
|-----|--------|
| `K` | Hover documentation |
| `gd` | Go to definition |
| `gr` | Find references |
| `gI` | Go to implementation |
| `gD` | Go to declaration |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |
| `<leader>f` | Format buffer/selection |
| `<leader>ds` | Document symbols |
| `<leader>ws` | Workspace symbols |

## Testing (Neotest)

| Key | Action |
|-----|--------|
| `<leader>tt` | Run nearest test |
| `<leader>tf` | Run file |
| `<leader>ta` | Run all tests |
| `<leader>td` | Debug nearest test |
| `<leader>ts` | Toggle summary |
| `<leader>to` | Open test output |
| `<leader>tO` | Toggle output panel |
| `<leader>tl` | Run last test |
| `<leader>tw` | Toggle watch |
| `<leader>tS` | Stop running tests |

## Debugging (DAP)

| Key | Action |
|-----|--------|
| `F5` | Start/continue |
| `F1` | Step into |
| `F2` | Step over |
| `F3` | Step out |
| `F7` | Toggle DAP UI |
| `<leader>b` | Toggle breakpoint |
| `<leader>B` | Set conditional breakpoint |

## Tasks (Overseer + just)

| Key | Action |
|-----|--------|
| `<leader>jj` | Run task picker |
| `<leader>jt` | Toggle task list |
| `<leader>jb` | Build task |
| `<leader>jd` | Run `just dev` |
| `<leader>jT` | Run `just test` |
| `<leader>jq` | Run `just qa` |
| `<leader>jl` | Run `just lint` |
| `<leader>jc` | Run `just typecheck` |

## Diagnostics (Trouble)

| Key | Action |
|-----|--------|
| `<leader>xx` | Workspace diagnostics |
| `<leader>xX` | Buffer diagnostics |
| `<leader>xQ` | Quickfix list |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |

## Terminal (Toggleterm)

| Key | Action |
|-----|--------|
| `F12` | Toggle floating terminal |
| `<leader>Th` | Horizontal terminal |
| `<leader>Tv` | Vertical terminal |
| `<leader>Tf` | Floating terminal |
| `Esc Esc` | Exit terminal mode |

## Git (Gitsigns)

| Key | Action |
|-----|--------|
| `<leader>hb` | Blame line |
| `<leader>tb` | Toggle inline blame |
| `<leader>hp` | Preview hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hS` | Stage buffer |
| `<leader>hu` | Undo stage hunk |
| `<leader>hR` | Reset buffer |
| `<leader>hd` | Diff against index |
| `<leader>hD` | Diff against last commit |
| `<leader>tD` | Toggle deleted lines |
| `[c` | Previous git change |
| `]c` | Next git change |
