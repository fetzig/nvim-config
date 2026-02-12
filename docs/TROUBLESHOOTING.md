# Troubleshooting

## LSP not working

Symptoms:
- No autocomplete
- No hover docs
- Go-to-definition not working

Checks:

```vim
:LspInfo
:Mason
:LspRestart
```

Python interpreter sanity check:

```vim
:lua print(vim.fn.exepath('python3'))
```

## Tests not running

Checks:

```bash
.venv/bin/python -m pytest --version
```

```vim
<leader>ts
:messages
```

Notes:
- `.venv/bin/python` is preferred when available
- Falls back to `python3`

## Debugging problems

### Test debug issues
- If pytest coverage flags are enabled globally, debugging may fail
- Try removing coverage flags or using `--no-cov`

### FastAPI attach issues

```vim
:Mason
```

Ensure `debugpy` is installed and app code has, for example:

```python
import debugpy
debugpy.listen(5678)
```

Check port usage:

```bash
lsof -i :5678
```

## Formatting/linting issues

```vim
:ConformInfo
:Mason
<leader>f
```

## Plugin load issues

```vim
:Lazy sync
:Lazy update
:checkhealth lazy
```

If it is a new setup, wait for Mason installs to finish, then retry.

## File tree issues

```vim
<leader>e
:NvimTreeFindFile
```

## Discovering mappings

```vim
:map <leader>tt
:help telescope.nvim
```

Or press `<leader>` and wait for `which-key`.
