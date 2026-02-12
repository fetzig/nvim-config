# Usage Guide

## Quick start

```bash
cd /path/to/your/project
nvim
```

Useful first keys:

- `<leader>e`: toggle file tree
- `<leader>sf`: find files
- `<leader>sg`: grep in project
- `<leader><leader>`: switch buffers
- `F12`: toggle floating terminal

## Daily workflows

### 1. Navigate and edit

- `gd`, `gr`, `gI`, `K` for code navigation and hover docs
- `<leader>rn` rename symbol
- `<leader>ca` code actions
- `<leader>f` format current buffer/selection

### 2. Run and debug tests

- `<leader>tt` run nearest test
- `<leader>tf` run current file
- `<leader>ta` run all tests
- `<leader>td` debug nearest test
- `<leader>ts` toggle test summary
- `<leader>to` show test output

### 3. Run project tasks

- `<leader>jj` open task picker
- `<leader>jd` run `just dev`
- `<leader>jT` run `just test`
- `<leader>jl` run `just lint`
- `<leader>jc` run `just typecheck`
- `<leader>jq` run `just qa`

### 4. Find and replace

- `<leader>sR` open Spectre project search/replace
- `<leader>sW` search current word in project
- `<leader>sp` search/replace in current file
- Visual select + `<leader>sR` for selection-based replace

### 5. Diagnostics and issues

- `<leader>xx` workspace diagnostics
- `<leader>xX` buffer diagnostics
- `<leader>xQ` quickfix list
- `]d` / `[d` next/prev diagnostic

## Python/FastAPI notes

- Neotest uses `.venv/bin/python` when present, otherwise `python3`
- DAP includes a FastAPI attach config on `localhost:5678`
- If using `debugpy.listen(5678)`, attach with `F5` and choose FastAPI config

## Session and window behavior

- Autosave runs on focus/insert/buffer transitions for normal file buffers
- Terminal buffers auto-enter insert mode and support `Esc Esc` to return to normal mode
- `:ProjectSetup` creates a default workspace layout (tree + two editor splits)

## Useful maintenance commands

```vim
:Lazy sync
:Lazy update
:Mason
:ConformInfo
:LspInfo
```

## Main config files

- `init.lua`
- `lua/custom/plugins/testing.lua`
- `lua/custom/plugins/tasks.lua`
- `lua/custom/plugins/search.lua`
- `lua/custom/plugins/ui.lua`
- `lua/custom/plugins/session.lua`
