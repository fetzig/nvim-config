# kickstart.nvim

## Introduction

A starting point for Neovim that is:

* Small
* Single-file
* Completely Documented

**NOT** a Neovim distribution, but instead a starting point for your configuration.

## Installation

### Install Neovim

Kickstart.nvim targets *only* the latest
['stable'](https://github.com/neovim/neovim/releases/tag/stable) and latest
['nightly'](https://github.com/neovim/neovim/releases/tag/nightly) of Neovim.
If you are experiencing issues, please make sure you have the latest versions.

### Install External Dependencies

External Requirements:
- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- Clipboard tool (xclip/xsel/win32yank or other depending on platform)
- A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons
  - if you have it set `vim.g.have_nerd_font` in `init.lua` to true
- Language Setup:
  - If you want to write Typescript, you need `npm`
  - If you want to write Golang, you will need `go`
  - etc.

> **NOTE**
> See [Install Recipes](#Install-Recipes) for additional Windows and Linux specific notes
> and quick install snippets

### Install Kickstart

> **NOTE**
> [Backup](#FAQ) your previous configuration (if any exists)

Neovim's configurations are located under the following paths, depending on your OS:

| OS | PATH |
| :- | :--- |
| Linux, MacOS | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |
| Windows (cmd)| `%localappdata%\nvim\` |
| Windows (powershell)| `$env:LOCALAPPDATA\nvim\` |

#### Recommended Step

[Fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo) this repo
so that you have your own copy that you can modify, then install by cloning the
fork to your machine using one of the commands below, depending on your OS.

> **NOTE**
> Your fork's url will be something like this:
> `https://github.com/<your_github_username>/kickstart.nvim.git`

You likely want to remove `lazy-lock.json` from your fork's `.gitignore` file
too - it's ignored in the kickstart repo to make maintenance easier, but it's
[recommmended to track it in version control](https://lazy.folke.io/usage/lockfile).

#### Clone kickstart.nvim
> **NOTE**
> If following the recommended step above (i.e., forking the repo), replace
> `<your_github_username>` in the commands below with your actual GitHub username

<details><summary> Linux and Mac </summary>

```sh
git clone git@github.com:<your_github_username>/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

</details>

<details><summary> Windows </summary>

If you're using `cmd.exe`:

```
git clone git@github.com:<your_github_username>/kickstart.nvim.git "%localappdata%\nvim"
```

If you're using `powershell.exe`

```
git clone git@github.com:<your_github_username>/kickstart.nvim.git "${env:LOCALAPPDATA}\nvim"
```

</details>

### Post Installation

Start Neovim

```sh
nvim
```

That's it! Lazy will install all the plugins you have. Use `:Lazy` to view
current plugin status. Hit `q` to close the window.

Read through the `init.lua` file in your configuration folder for more
information about extending and exploring Neovim. That also includes
examples of adding popularly requested plugins.


### Getting Started

[The Only Video You Need to Get Started with Neovim](https://youtu.be/m8C0Cq9Uv9o)

### FAQ

* What should I do if I already have a pre-existing neovim configuration?
  * You should back it up and then delete all associated files.
  * This includes your existing init.lua and the neovim files in `~/.local`
    which can be deleted with `rm -rf ~/.local/share/nvim/`
* Can I keep my existing configuration in parallel to kickstart?
  * Yes! You can use [NVIM_APPNAME](https://neovim.io/doc/user/starting.html#%24NVIM_APPNAME)`=nvim-NAME`
    to maintain multiple configurations. For example, you can install the kickstart
    configuration in `~/.config/nvim-kickstart` and create an alias:
    ```
    alias nvim-kickstart='NVIM_APPNAME="nvim-kickstart" nvim'
    ```
    When you run Neovim using `nvim-kickstart` alias it will use the alternative
    config directory and the matching local directory
    `~/.local/share/nvim-kickstart`. You can apply this approach to any Neovim
    distribution that you would like to try out.
* What if I want to "uninstall" this configuration:
  * See [lazy.nvim uninstall](https://lazy.folke.io/usage#-uninstalling) information
* Why is the kickstart `init.lua` a single file? Wouldn't it make sense to split it into multiple files?
  * The main purpose of kickstart is to serve as a teaching tool and a reference
    configuration that someone can easily use to `git clone` as a basis for their own.
    As you progress in learning Neovim and Lua, you might consider splitting `init.lua`
    into smaller parts. A fork of kickstart that does this while maintaining the 
    same functionality is available here:
    * [kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim)
  * Discussions on this topic can be found here:
    * [Restructure the configuration](https://github.com/nvim-lua/kickstart.nvim/issues/218)
    * [Reorganize init.lua into a multi-file setup](https://github.com/nvim-lua/kickstart.nvim/pull/473)

### Install Recipes

Below you can find OS specific install instructions for Neovim and dependencies.

After installing all the dependencies continue with the [Install Kickstart](#Install-Kickstart) step.

#### Windows Installation

<details><summary>Windows with Microsoft C++ Build Tools and CMake</summary>
Installation may require installing build tools and updating the run command for `telescope-fzf-native`

See `telescope-fzf-native` documentation for [more details](https://github.com/nvim-telescope/telescope-fzf-native.nvim#installation)

This requires:

- Install CMake and the Microsoft C++ Build Tools on Windows

```lua
{'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
```
</details>
<details><summary>Windows with gcc/make using chocolatey</summary>
Alternatively, one can install gcc and make which don't require changing the config,
the easiest way is to use choco:

1. install [chocolatey](https://chocolatey.org/install)
either follow the instructions on the page or use winget,
run in cmd as **admin**:
```
winget install --accept-source-agreements chocolatey.chocolatey
```

2. install all requirements using choco, exit previous cmd and
open a new one so that choco path is set, and run in cmd as **admin**:
```
choco install -y neovim git ripgrep wget fd unzip gzip mingw make
```
</details>
<details><summary>WSL (Windows Subsystem for Linux)</summary>

```
wsl --install
wsl
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
```
</details>

#### Linux Install
<details><summary>Ubuntu Install Steps</summary>

```
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
```
</details>
<details><summary>Debian Install Steps</summary>

```
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip curl

# Now we install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim-linux64
sudo mkdir -p /opt/nvim-linux64
sudo chmod a+rX /opt/nvim-linux64
sudo tar -C /opt -xzf nvim-linux64.tar.gz

# make it available in /usr/local/bin, distro installs to /usr/bin
sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/
```
</details>
<details><summary>Fedora Install Steps</summary>

```
sudo dnf install -y gcc make git ripgrep fd-find unzip neovim
```
</details>

<details><summary>Arch Install Steps</summary>

```
sudo pacman -S --noconfirm --needed gcc make git ripgrep fd unzip neovim
```
</details>

---

# Neovim Development Guide

Complete guide to your Neovim environment configured for Python/FastAPI development with VS Code-like features and more.

## Table of Contents
- [Quick Start](#quick-start)
- [Neovim Basics](#neovim-basics)
- [Complete Keybinding Reference](#complete-keybinding-reference)
- [Common Workflows](#common-workflows)
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
| `<leader>e` | Toggle file tree (nvim-tree) |
| `<leader>sf` | Find files (telescope) |
| `<leader>sg` | Search by grep |
| `<leader>sw` | Search word under cursor |
| `<leader>sd` | Search diagnostics |
| `<leader>/` | Search in current buffer |
| `<leader><leader>` | Switch buffers |

### Find & Replace (Leader: `s`) - Spectre
| Key | Action |
|-----|--------|
| `<leader>sR` | Open search/replace UI (Spectre) |
| `<leader>sW` | Search current word in project |
| `<leader>sp` | Search/replace in current file only |
| `<leader>sR` (visual) | Search selected text |

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

### 4. Code Navigation & Refactoring

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

### 5. Running Project Tasks

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

### 6. Git Workflow with GitHub CLI

```bash
F12                        # Open terminal

# GitHub operations
gh pr list
gh pr view 123
gh pr create

Esc Esc                    # Exit terminal
```

### 7. Find & Replace Across Files

**Using Spectre (Visual UI with preview):**

**Method 1 - Search entire project:**
1. `<leader>sR` - Open Spectre
2. Enter search pattern in first field (supports regex)
3. Tab to move to replacement field
4. Enter replacement text
5. Press Enter on a result to confirm replacement

**Method 2 - Search current word:**
1. Place cursor on word to replace
2. `<leader>sW` - Opens Spectre with word pre-filled
3. Tab to replacement field and type replacement
4. Press Enter on results to replace

**Method 3 - Search in current file only:**
1. `<leader>sp` - Opens Spectre for current file
2. Enter search/replace patterns
3. Press Enter on results to replace

**Method 4 - Visual selection:**
1. Visual select text: `V` + movement
2. `<leader>sR` - Search for selection
3. Tab to replacement field
4. Press Enter on results to replace

**Spectre UI keybindings (when Spectre window is open):**
```
Tab / Shift+Tab   Navigate between fields (search/replace/path)
<CR> (Enter)      Execute replace on selected item or confirm input
<Esc>             Close Spectre
?                 Show help with all keybindings
```

**Tips:**
- Spectre shows a live preview of all matches
- Navigate through the interface with Tab
- Press Enter when cursor is on a result line to replace that specific match
- The UI shows helpful hints at the bottom

**Using Telescope + Quickfix (Command-line approach):**
1. `<leader>sg` - Search for pattern
2. `<C-q>` - Send results to quickfix
3. `:cdo s/old/new/g | update` - Replace in all files

### 8. Multiple Files & Splits

```
:vsplit filename.py        # Vertical split
:split filename.py         # Horizontal split
Ctrl+h/j/k/l              # Navigate splits
<leader><leader>           # Switch buffers
<leader>sf                # Find & open file
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

### File tree not showing

```vim
<leader>e             " Toggle nvim-tree
:NvimTreeFindFile     " Open tree and reveal current file
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
- ✅ Find & Replace: nvim-spectre with live preview

### File Structure

```
~/.config/nvim/
├── init.lua                      # Main configuration
└── lua/
    ├── kickstart/plugins/
    │   ├── debug.lua             # nvim-dap (debugging)
    │   ├── lint.lua              # nvim-lint
    │   ├── gitsigns.lua          # Git integration
    │   ├── neo-tree.lua          # Optional kickstart example
    │   ├── indent_line.lua       # Indent guides
    │   └── autopairs.lua         # Auto pairs
    └── custom/plugins/
        ├── testing.lua           # Neotest (pytest)
        ├── tasks.lua             # Overseer (just commands)
        ├── search.lua            # nvim-spectre (find & replace)
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
<leader>sR      Find & replace (Spectre)
<leader>tt      Run test
<leader>td      Debug test
<leader>jj      Run task
<leader>ca      Code actions
<leader>rn      Rename
gd              Go to definition
K               Hover docs
F12             Terminal
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

Adapt this guide to your own project conventions and local tooling.
