# nvim-config

Personal Neovim configuration with LSP, testing, debugging, tasks, and terminal tooling.

This setup started from `kickstart.nvim` and is now tailored for daily project work.

## What is included

- LSP + completion: `pyright`, `ruff`, `ts_ls`, `yamlls`, `jsonls`, `terraformls`
- Formatting/linting: `conform.nvim`, `nvim-lint`, Mason-managed tools
- Testing/debugging: `neotest` + `pytest`, `nvim-dap`, `debugpy`
- Workflow plugins: `telescope`, `trouble`, `toggleterm`, `overseer`, `spectre`, `gitsigns`, `nvim-tree`

## Quick start

1. Install requirements: `git`, `make`, `unzip`, `gcc`, `ripgrep`, Neovim latest stable.
2. Clone this repo to your config path:

```sh
git clone <your-repo-url> "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

3. Start Neovim:

```sh
nvim
```

4. Let plugins/tools install, then check:

```vim
:Lazy
:Mason
:checkhealth
```

## Documentation

- Usage and workflows: `docs/USAGE.md`
- Full keymap reference: `docs/KEYMAPS.md`
- Troubleshooting: `docs/TROUBLESHOOTING.md`

## Repo layout

- Main config: `init.lua`
- Custom plugins: `lua/custom/plugins/`

## License

MIT (`LICENSE.md`)
