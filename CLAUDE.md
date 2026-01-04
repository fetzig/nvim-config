# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This Neovim configuration is based on kickstart.nvim and follows a modular architecture:

- **Core**: `/init.lua` - Main entry point with basic settings, autocommands, and core plugins
- **Base Plugins**: `/lua/kickstart/plugins/` - Foundation plugins (LSP, debugging, linting, git)
- **Custom Extensions**: `/lua/custom/plugins/` - Additional functionality (testing, tasks, search, UI)

### Key Components

**Development Tools:**
- LSP servers: Pyright (Python), Ruff (linting), Terraform, YAML, JSON, Lua
- Formatters: ruff_format, stylua, prettier, terraform_fmt
- Testing: Neotest with pytest integration, including debug support
- Debugging: nvim-dap with debugpy for Python, includes FastAPI attach configuration
- Task Runner: Overseer.nvim for executing `just` commands

**Enhanced Features:**
- Find/Replace: nvim-spectre with live preview across project
- Diagnostics: Trouble.nvim for better error/warning display
- Terminal: Toggleterm for floating/split terminals + Claude Code integration
- Git: Gitsigns with full hunk management
- File Management: nvim-tree with dotfiles visible

## Common Commands

### Development Workflow
```bash
# Linting and type checking (run these before commits)
just lint           # Run project linter
just typecheck      # Run type checker
just qa             # Run full quality assurance

# Testing
just test           # Run test suite
just dev            # Start development server
```

### Key Neovim Commands
- `:Mason` - Manage LSP servers, formatters, linters, debuggers
- `:Lazy` - Plugin management (install, update, sync)
- `:checkhealth` - Verify configuration health
- `:LspInfo` - Check LSP server status

## Important Keybindings

**Leader Key**: `<Space>`

### Development Essentials
| Key | Action | Notes |
|-----|--------|-------|
| `<leader>e` | Toggle file tree | Shows dotfiles, git-ignored files |
| `<leader>sf` | Find files | Telescope with hidden files |
| `<leader>sg` | Live grep | Search across project |
| `<leader>sR` | Find & replace | Spectre with live preview |
| `<leader>f` | Format buffer | Auto-formats on save |

### Testing & Debugging
| Key | Action | Notes |
|-----|--------|-------|
| `<leader>tt` | Run test under cursor | Uses project .venv if available |
| `<leader>tf` | Run all tests in file | |
| `<leader>ta` | Run all tests | |
| `<leader>td` | Debug test | Requires pytest without --cov |
| `<leader>ts` | Toggle test summary | Shows test results |
| `<leader>tw` | Toggle watch mode | Auto-run tests on save |
| `F5` | Start/continue debug | |
| `F1/F2/F3` | Step into/over/out | |
| `<leader>b` | Toggle breakpoint | |

### Task Management (just commands)
| Key | Action |
|-----|--------|
| `<leader>jj` | Run any just task (picker) |
| `<leader>jd` | just dev |
| `<leader>jT` | just test |
| `<leader>jl` | just lint |
| `<leader>jc` | just typecheck |
| `<leader>jq` | just qa |

### Claude Code Integration
| Key | Action |
|-----|--------|
| `<leader>ac` | Toggle Claude terminal (30% right split) |
| `<leader>af` | Focus Claude terminal |
| `<leader>ar` | Resume Claude session |
| `<leader>as` | Send visual selection to Claude |
| `<leader>aa` | Accept Claude's diff |
| `<leader>ad` | Deny Claude's diff |

### Code Navigation & LSP
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Find references |
| `K` | Hover documentation |
| `<leader>ca` | Code actions (auto-import, fixes) |
| `<leader>rn` | Rename symbol |
| `]d` / `[d` | Next/previous diagnostic |

### Window & Terminal
| Key | Action |
|-----|--------|
| `Ctrl+h/j/k/l` | Navigate windows (tmux-aware) |
| `F12` | Toggle floating terminal |
| `Esc Esc` | Exit terminal mode |

## Configuration Details

### Auto-save Behavior
Files automatically save on:
- Losing focus (`FocusLost`)  
- Leaving insert mode (`InsertLeave`)
- Switching buffers (`BufLeave`)

Excluded: terminal, quickfix, help, file tree buffers

### Python/Testing Setup
- Uses `.venv/bin/python` if available, falls back to `python3`
- Pytest args: `--log-level=DEBUG --color=yes -vv`
- DAP debugging enabled for tests (disable coverage with `--no-cov`)
- FastAPI debug attach configured on port 5678

### File Search Configuration
- Telescope includes hidden files and searches in dotfiles
- Excludes: `.git/`, `node_modules/`, `__pycache__/`, `.DS_Store`
- Ripgrep configured to search hidden files with `--hidden` flag

### Terminal Management
- Terminal buffers auto-enter insert mode with 10000 scrollback
- Mouse clicks return to terminal mode automatically
- `Esc Esc` always exits terminal mode

## Debugging FastAPI Applications

1. Add to your FastAPI code:
   ```python
   import debugpy
   debugpy.listen(5678)
   debugpy.wait_for_client()  # Optional: pause until attached
   ```

2. Start server: `<leader>jd` (runs `just dev`)
3. In nvim: `F5` → Select "Attach to FastAPI (just dev)"
4. Set breakpoints with `<leader>b`
5. Trigger endpoints to hit breakpoints

## Common Issues & Solutions

**LSP not working**: `:LspInfo` to check status, `:Mason` to verify tools installed
**Tests not discovered**: Check `.venv/bin/python` exists, verify pytest installation
**Debugging fails**: Remove `--cov` from pytest.ini, check debugpy installation
**Formatting not working**: `:ConformInfo` to check status, `:Mason` for formatters
**Mason errors on startup**: LSP servers are provided by NixOS packages, Mason errors are non-fatal

## NixOS Integration

This configuration integrates with NixOS packages for better reliability:

**System-provided tools:**
- `pyright` - Python LSP server
- `ruff` - Python linter/formatter
- `lua-language-server` - Lua LSP
- `terraform-ls` - Terraform LSP  
- `yaml-language-server` - YAML LSP
- `stylua` - Lua formatter
- `prettier` - JSON/YAML formatter

**Mason supplements:** Additional tools not available in NixOS packages are installed via Mason when needed.

**After NixOS rebuild:** Run `source ~/.bashrc` or restart terminal to update PATH with local Python symlink.

## File Structure Reference

```
~/.config/nvim/
├── init.lua                           # Main config with basic settings
├── lua/kickstart/plugins/
│   ├── debug.lua                      # DAP debugging (Python, Go)
│   ├── gitsigns.lua                   # Git integration
│   └── lint.lua                       # Linting configuration
└── lua/custom/plugins/
    ├── testing.lua                    # Neotest with pytest
    ├── tasks.lua                      # Overseer for just commands
    ├── search.lua                     # nvim-spectre find/replace
    └── ui.lua                         # Trouble, toggleterm, auto dark mode
```