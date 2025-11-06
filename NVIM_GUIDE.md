# Neovim Development Guide

Complete guide to your Neovim environment configured for Python/FastAPI development with VS Code-like features and more.

## Table of Contents
- [Quick Start](#quick-start)
- [Neovim Basics](#neovim-basics)
- [Complete Keybinding Reference](#complete-keybinding-reference)
- [Common Workflows](#common-workflows)
- [Claude Code Integration](#claude-code-integration)
- [Troubleshooting](#troubleshooting)
- [Configuration](#configuration)

---

## Quick Start

### Opening Neovim
```bash
cd /path/to/your/project
nvim                           # Open nvim
nvim filename.py              # Open specific file
```

### Essential First Commands
- **Leader Key**: `Space` - All custom commands start with Space
- **File tree**: `<leader>e` - Toggle file explorer
- **Find files**: `<leader>sf` - Fuzzy file finder
- **Search in project**: `<leader>sg` - Grep search
- **Command palette**: `<leader>` then wait - Shows all available commands

### Getting Help
- `:help <topic>` - Built-in help
- `:checkhealth` - Verify setup
- `:messages` - View recent messages
- `<leader>` + wait - which-key shows all commands

---

## Neovim Basics

### Modes
- **Normal mode** - Default mode for navigation (press `Esc`)
- **Insert mode** - For typing text (press `i`)
- **Visual mode** - For selecting text (press `v` for character, `V` for line, `Ctrl+v` for block)
- **Command mode** - For commands (press `:`)

### Essential Commands
| Command | Action |
|---------|--------|
| `:q` | Quit |
| `:w` | Save (write) |
| `:wq` | Save and quit |
| `:q!` | Quit without saving |
| `Esc` | Return to normal mode |
| `i` | Enter insert mode |
| `v` | Enter visual mode |
| `u` | Undo |
| `Ctrl+r` | Redo |

### Navigation in Normal Mode
| Key | Action |
|-----|--------|
| `h` `j` `k` `l` | Left, Down, Up, Right |
| `w` | Next word |
| `b` | Previous word |
| `0` | Start of line |
| `$` | End of line |
| `gg` | Go to top of file |
| `G` | Go to bottom of file |
| `Ctrl+d` | Scroll down half page |
| `Ctrl+u` | Scroll up half page |
| `{` `}` | Previous/next paragraph |

### Window Navigation
| Key | Action |
|-----|--------|
| `Ctrl+h` | Move to left window (tmux-aware) |
| `Ctrl+l` | Move to right window (tmux-aware) |
| `Ctrl+j` | Move to lower window |
| `Ctrl+k` | Move to upper window |
| `:vsplit` | Split vertically |
| `:split` | Split horizontally |

---

## Complete Keybinding Reference

**Leader Key**: `Space`

### File & Search (Leader: `s`)
| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file tree (neo-tree) |
| `<leader>sf` | Find files (telescope) |
| `<leader>sg` | Search by grep |
| `<leader>sw` | Search word under cursor |
| `<leader>sd` | Search diagnostics |
| `<leader>/` | Search in current buffer |
| `<leader><leader>` | Switch buffers |

### LSP & Code Navigation
| Key | Action |
|-----|--------|
| `K` | Hover documentation |
| `gd` | Go to definition |
| `gr` | Find references |
| `gI` | Go to implementation |
| `gD` | Go to declaration |
| `<leader>ca` | Code actions (auto-import, fixes) |
| `<leader>rn` | Rename symbol |
| `<leader>f` | Format buffer/selection |
| `<leader>ds` | Document symbols |
| `<leader>ws` | Workspace symbols |

### Testing (Leader: `t`) - Neotest
| Key | Action |
|-----|--------|
| `<leader>tt` | Run test under cursor |
| `<leader>tf` | Run all tests in file |
| `<leader>ta` | Run all tests in project |
| `<leader>td` | **Debug** test under cursor |
| `<leader>ts` | Toggle test summary window |
| `<leader>to` | Show test output |
| `<leader>tO` | Toggle output panel |
| `<leader>tl` | Run last test |
| `<leader>tw` | Toggle watch mode (auto-run on save) |
| `<leader>tS` | Stop running tests |

### Debugging (DAP)
| Key | Action |
|-----|--------|
| `F5` | Start/Continue debugging |
| `F1` | Step into |
| `F2` | Step over |
| `F3` | Step out |
| `<leader>b` | Toggle breakpoint |
| `<leader>B` | Set conditional breakpoint |
| `F7` | Toggle debug UI |

### Task Running (Leader: `j`) - Overseer + Just
| Key | Action |
|-----|--------|
| `<leader>jj` | Run any just task (picker) |
| `<leader>jt` | Toggle task list |
| `<leader>jb` | Build task |
| `<leader>jd` | Run `just dev` |
| `<leader>jT` | Run `just test` |
| `<leader>jq` | Run `just qa` |
| `<leader>jl` | Run `just lint` |
| `<leader>jc` | Run `just typecheck` |

### Diagnostics (Leader: `x`) - Trouble
| Key | Action |
|-----|--------|
| `<leader>xx` | Show all workspace diagnostics |
| `<leader>xX` | Show buffer diagnostics |
| `<leader>xQ` | Show quickfix list |
| `[d` | Go to previous diagnostic |
| `]d` | Go to next diagnostic |

### Terminal (Leader: `T`) - Toggleterm
| Key | Action |
|-----|--------|
| `F12` | Toggle floating terminal |
| `<leader>Th` | Open horizontal terminal |
| `<leader>Tv` | Open vertical terminal |
| `<leader>Tf` | Open floating terminal |
| `Esc Esc` | Exit terminal mode → normal mode |

### Claude Code (Leader: `a`)
| Key | Action |
|-----|--------|
| `<leader>ac` | Toggle Claude Code terminal (right split, 30% width) |
| `<leader>af` | Focus Claude terminal |
| `<leader>ar` | Resume previous Claude session |
| `<leader>aC` | Continue with context |
| `<leader>aa` | Accept diff changes |
| `<leader>ad` | Deny diff changes |
| `<leader>as` | Send visual selection to Claude (visual mode) |

### Git (Leader: `h`) - Gitsigns
| Key | Action |
|-----|--------|
| `<leader>hb` | Git blame line (show popup) |
| `<leader>tb` | Toggle inline git blame display |
| `<leader>hp` | Preview hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hS` | Stage buffer |
| `<leader>hu` | Undo stage hunk |
| `<leader>hR` | Reset buffer |
| `<leader>hd` | Git diff against index |
| `<leader>hD` | Git diff against last commit |
| `<leader>tD` | Toggle show deleted lines |
| `[c` | Previous git change |
| `]c` | Next git change |

---

## Common Workflows

### 1. Starting a Development Session

```bash
# Open project
cd ~/src/your-project
nvim

# Inside nvim:
<leader>e          # Open file tree
<leader>sf         # Or find files
<leader>ac         # Open Claude Code (optional)
```

### 2. Running & Debugging Tests

**Quick test run:**
1. Open test file: `<leader>sf` → type test name
2. Place cursor on test function
3. Run test: `<leader>tt`
4. View output: `<leader>to`

**Debug test:**
1. Set breakpoint in test: `<leader>b`
2. Debug test: `<leader>td`
3. Step through: `F2` (step over), `F1` (step into)
4. Continue: `F5`

**Watch mode (TDD):**
1. Open source + test side by side: `:vsplit`
2. Enable watch: `<leader>tw`
3. Edit code → tests auto-run on save
4. View summary: `<leader>ts`

### 3. Debugging FastAPI Application

**Method 1: Attach to running server**
1. Add to your code (e.g., in `main.py`):
   ```python
   import debugpy
   debugpy.listen(5678)
   ```
2. Start server: `<leader>jd` (runs `just dev`)
3. In nvim: `F5` → Select "Attach to FastAPI (just dev)"
4. Set breakpoints: `<leader>b`
5. Trigger endpoint (curl, httpie, browser)
6. Debugger stops at breakpoint

**Method 2: Debug tests**
- Just use `<leader>td` on any test

### 4. Working with Claude Code

**Opening Claude:**
1. In nvim: `<leader>ac`
2. Claude opens in right split (30% width)
3. Navigate: `Ctrl+h` (back to code), `Ctrl+l` (to Claude)

**Sending code to Claude:**
1. Visual select code: `V` (line mode), then `j`/`k` to select
2. Send: `<leader>as`
3. Claude receives selection with file context

**Accepting Claude's changes:**
1. Claude shows diff in editor
2. Review changes
3. Accept: `<leader>aa` or Deny: `<leader>ad`

**Terminal mode:**
- When in Claude terminal: `Esc Esc` to exit to normal mode
- Return to terminal mode: just click or `i`

### 5. Code Navigation & Refactoring

**Understanding code:**
```
K                  # Hover docs on symbol
gd                 # Go to definition
gr                 # Find all references
<leader>sw         # Search for word under cursor
```

**Refactoring:**
```
<leader>rn         # Rename symbol across project
<leader>ca         # Code actions (extract, organize imports)
<leader>f          # Format file
```

**Find errors:**
```
<leader>xx         # Open all diagnostics (Trouble)
]d                 # Next error
[d                 # Previous error
```

### 6. Running Project Tasks

**Using task runner:**
```
<leader>jj         # Opens picker with all just commands
                   # Select with Enter
<leader>jt         # Toggle task list
```

**Quick shortcuts:**
```
<leader>jd         # just dev
<leader>jT         # just test
<leader>jl         # just lint
<leader>jc         # just typecheck
<leader>jq         # just qa
```

**Or use floating terminal:**
```
F12                # Open terminal
just dev           # Run command directly
Esc Esc            # Exit terminal
```

### 7. Git Workflow with GitHub CLI

```bash
F12                        # Open terminal
source ~/.bashrc           # Load jira token

# GitHub operations
gh pr list
gh pr view 123
gh pr create

# Jira operations
jira-cli issue WKW-1234

Esc Esc                    # Exit terminal
```

### 8. Multiple Files & Splits

```
:vsplit filename.py        # Vertical split
:split filename.py         # Horizontal split
Ctrl+h/j/k/l              # Navigate splits
<leader><leader>           # Switch buffers
<leader>sf                # Find & open file
```

---

## Claude Code Integration

### Setup
Claude Code is integrated via a terminal split that runs the `claude` CLI.

### Opening Claude
**Method 1 - Keybinding**: `<leader>ac`
**Method 2 - Command**: `:ClaudeCode`

Opens in a right-side split (30% width).

### Working with Claude

**Sending code:**
1. Select code in visual mode: `V` then move with `j/k`
2. Send: `<leader>as`
3. Claude receives file context + selection

**Reviewing diffs:**
- Claude creates diffs in your editor
- Accept: `<leader>aa`
- Deny: `<leader>ad`

**Navigation:**
- To editor: `Ctrl+h`
- To Claude: `Ctrl+l`
- Focus Claude: `<leader>af`

**Terminal control:**
- Exit terminal mode: `Esc Esc`
- Close Claude: `<leader>ac` (toggles)

### Example Session
```
1. Open file: <leader>sf → myfile.py
2. Toggle Claude: <leader>ac
3. Ask Claude to help (type in terminal)
4. Select function: V + movement keys
5. Send to Claude: <leader>as
6. Review Claude's diff
7. Accept: <leader>aa
8. Navigate back: Ctrl+h
```

---

## Troubleshooting

### LSP not working

**Symptoms**: No autocomplete, no hover docs, no go-to-definition

**Solutions:**
```vim
:LspInfo              " Check LSP status
:Mason                " Verify tools installed (Pyright, Ruff)
:LspRestart           " Restart language server
```

**Check Python path:**
- Ensure `.venv` exists: `ls .venv/bin/python`
- Or set in project: `:lua print(vim.fn.exepath('python3'))`

### Tests not running

**Symptoms**: No tests found, neotest not discovering tests

**Solutions:**
```bash
# Verify pytest installed
.venv/bin/python -m pytest --version

# In nvim
<leader>ts            # Open summary to see errors
:messages             # Check for error messages
```

**Check virtual environment:**
- Neotest uses `.venv/bin/python` if available
- Fallback: `python3`

### Debugging not working

**For tests:**
- Check `pytest.ini` for `--cov` flag
- Coverage breaks debugging - remove or use `--no-cov`

**For server:**
```vim
:Mason                # Verify debugpy installed
```

Add to code:
```python
import debugpy
debugpy.listen(5678)
debugpy.wait_for_client()  # Optional: pause until debugger attaches
```

**Port in use:**
```bash
lsof -i :5678         # Check if port is in use
```

### Formatting not working

```vim
:ConformInfo          " Check formatter status
:Mason                " Verify ruff installed
<leader>f             " Try manual format
```

**Auto-format on save:**
- Should work automatically
- If not, check `:messages` for errors

### Plugins not loading

```vim
:Lazy sync            " Sync all plugins
:Lazy update          " Update plugins
:checkhealth lazy     " Check lazy.nvim health
```

**First time after install:**
- Wait 2-3 minutes for Mason to install tools
- Check `:Mason` for installation status

### Claude Code terminal issues

**Not responding:**
```vim
:ClaudeCode           " Toggle off/on
```

**Check if it works in shell:**
```bash
F12                   # Open terminal
claude --help         # Test CLI
Esc Esc              # Exit
```

**Terminal mode stuck:**
- `Esc Esc` - Exit terminal mode
- `i` - Re-enter terminal mode

### File tree not showing

```vim
<leader>e             " Toggle neo-tree
:Neotree reveal       " Open and reveal current file
```

### Finding keybindings

```vim
:map <leader>tt       " Show what a key does
<leader>              " Wait - which-key shows all
:help telescope.nvim  " Read plugin docs
```

---

## Configuration

### What's Installed

**Core Features:**
- ✅ Testing: Neotest with pytest integration
- ✅ Debugging: nvim-dap with debugpy support
- ✅ LSP: Pyright, Ruff, YAML, JSON, Terraform
- ✅ Linting: Ruff, yamllint, jsonlint, tflint
- ✅ Formatting: Ruff, terraform_fmt, prettier
- ✅ Task Runner: Overseer.nvim for `just` commands
- ✅ Terminal: Toggleterm for quick access
- ✅ Diagnostics: Trouble.nvim for error display
- ✅ Claude Code: Integrated terminal

### File Structure

```
~/.config/nvim/
├── init.lua                      # Main configuration
└── lua/
    ├── kickstart/plugins/
    │   ├── debug.lua             # nvim-dap (debugging)
    │   ├── lint.lua              # nvim-lint
    │   ├── gitsigns.lua          # Git integration
    │   ├── neo-tree.lua          # File tree
    │   ├── indent_line.lua       # Indent guides
    │   └── autopairs.lua         # Auto pairs
    └── custom/plugins/
        ├── testing.lua           # Neotest (pytest)
        ├── tasks.lua             # Overseer (just commands)
        └── ui.lua                # Trouble, toggleterm, etc.
```

### Key Configuration Details

**Auto-save:** Files save automatically on:
- Losing focus (`FocusLost`)
- Leaving insert mode (`InsertLeave`)
- Switching buffers (`BufLeave`)

**Python/pytest:**
- Uses `.venv/bin/python` if available
- pytest args: `--log-level=DEBUG --color=yes -vv`
- DAP enabled for test debugging

**Terminal behavior:**
- Terminal buffers auto-enter insert mode
- Prevents accidental normal mode on mouse clicks
- `Esc Esc` always exits terminal mode

### Managing Configuration

**Edit config:**
```vim
:e ~/.config/nvim/init.lua
:e ~/.config/nvim/lua/custom/plugins/testing.lua
```

**Reload config:**
```vim
:source %                    " Reload current file
:Lazy reload <plugin>        " Reload specific plugin
```

**Install new LSP/tools:**
```vim
:Mason                       " Opens Mason UI
# Press 'i' on tool to install
# Press 'u' on tool to uninstall
# Press 'g?' for help
```

---

## Tips & Tricks

### Efficiency Tips

1. **which-key**: Press `<leader>` and wait - shows all available commands
2. **Repeat command**: Press `.` to repeat last change
3. **Jump back**: `Ctrl+o` jumps to previous location, `Ctrl+i` jumps forward
4. **Multiple cursors**: `Ctrl+v` for visual block, `I` to insert at start of each line
5. **Split navigation**: `Ctrl+h/j/k/l` works across vim and tmux seamlessly
6. **Quick file switch**: `<leader><leader>` for buffer list
7. **Search & jump**: `<leader>sg` + search term + `Ctrl+q` to send to quickfix
8. **Hover docs**: Press `K` twice to jump into hover window (then `q` to close)
9. **Code actions**: `<leader>ca` for auto-imports, organize imports, quick fixes
10. **Format selection**: Visual select + `<leader>f` formats only selection

### Vim Motions to Master

- `ci"` - Change inside quotes
- `da{` - Delete around curly braces
- `yap` - Yank around paragraph
- `vi(` - Visual select inside parentheses
- `dt,` - Delete until comma
- `f/F` - Find character forward/backward
- `t/T` - Till character forward/backward
- `*/#` - Search word under cursor forward/backward

### Project-specific Shortcuts

**Python/FastAPI:**
```
<leader>ca            # Auto-import missing imports
<leader>rn            # Rename class/function across files
gd                    # Jump to definition
K                     # Show type hints & docs
```

**Testing workflow:**
```
<leader>tw            # Watch mode - tests run on save
<leader>ts            # Summary - overview of all tests
<leader>td            # Debug - step through failing test
```

**Task management:**
```
<leader>jj            # Quick picker for any command
<leader>jt            # Task list - see running tasks
F12                   # Terminal - for custom commands
```

---

## Quick Reference Card

**Print or keep handy:**

### Most Used (memorize these)
```
<leader>e       File tree
<leader>sf      Find files
<leader>sg      Grep search
<leader>tt      Run test
<leader>td      Debug test
<leader>jj      Run task
<leader>ca      Code actions
<leader>rn      Rename
gd              Go to definition
K               Hover docs
F12             Terminal
<leader>ac      Claude Code
```

### Modes
```
Esc             Normal mode
i               Insert mode
v               Visual mode
:               Command mode
Esc Esc         Exit terminal mode
```

### Navigation
```
Ctrl+h/j/k/l    Move between windows
<leader><leader> Switch buffers
gd              Go to definition
gr              Find references
]d / [d         Next/prev error
```

### Testing & Debugging
```
<leader>tt      Run test
<leader>td      Debug test
F5              Continue
F2              Step over
<leader>b       Breakpoint
```

---

## Learning Resources

- **Neovim Tutorial**: `:Tutor` (interactive, ~30 minutes)
- **Help System**: `:help <topic>` (comprehensive)
- **Plugin Docs**: `:help neotest`, `:help dap`, etc.
- **Kickstart**: [github.com/nvim-lua/kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
- **Mason Registry**: [mason-registry.dev](https://mason-registry.dev/)

---

## Next Steps

1. **Learn basic motions**: Run `:Tutor`
2. **Customize keybindings**: Edit `~/.config/nvim/init.lua`
3. **Add LSP servers**: Check `:Mason` for your languages
4. **Explore plugins**: Press `<leader>` and explore commands
5. **Practice workflows**: Try each common workflow section above

---

**Enjoy coding in Neovim!** 🚀

For project-specific setup, see `CLAUDE.md` in your project root.
For personal preferences, see `~/.claude/CLAUDE.md`.
