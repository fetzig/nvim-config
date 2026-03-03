-- hotreload.lua — Auto-reload buffers on external file changes
-- Designed for AI coding agent workflows where files change outside nvim.

local M = {}

-- Reload visible buffers in the current tab
local function reload_visible_buffers()
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local buf = vim.api.nvim_win_get_buf(win)
    local bt = vim.bo[buf].buftype
    -- Skip special buffers (diffview, neo-tree, terminals, etc.)
    if bt == '' and vim.bo[buf].modifiable then
      -- Don't reload if buffer has unsaved changes
      if not vim.bo[buf].modified then
        vim.api.nvim_buf_call(buf, function()
          vim.cmd 'silent! checktime'
        end)
      end
    end
  end
end

-- Try to refresh diffview if it's open
local function refresh_diffview()
  local ok, lib = pcall(require, 'diffview.lib')
  if ok then
    local view = lib.get_current_view()
    if view then
      view:update_files()
    end
  end
end

-- Autocmd-based reload on focus/cursor events
local function setup_autocmds()
  local group = vim.api.nvim_create_augroup('HotReload', { clear = true })

  vim.api.nvim_create_autocmd(
    { 'FocusGained', 'TermLeave', 'BufEnter', 'WinEnter', 'CursorHold', 'CursorHoldI' },
    {
      group = group,
      callback = function()
        reload_visible_buffers()
      end,
    }
  )
end

-- Filesystem watcher using libuv
local fs_event = nil

local function setup_fs_watcher()
  local cwd = vim.fn.getcwd()
  fs_event = vim.uv.new_fs_event()
  if not fs_event then
    return
  end

  -- Debounce: don't fire more than once per 500ms
  local timer = vim.uv.new_timer()
  local pending = false

  fs_event:start(cwd, { recursive = true }, function(err, filename)
    if err then
      return
    end
    -- Ignore .git internals except HEAD (for branch switches)
    if filename and filename:match '^%.git/' and not filename:match '^%.git/HEAD$' then
      return
    end
    if not pending then
      pending = true
      timer:start(500, 0, function()
        pending = false
        vim.schedule(function()
          reload_visible_buffers()
          refresh_diffview()
        end)
      end)
    end
  end)
end

function M.setup()
  -- Enable autoread so checktime actually reloads
  vim.o.autoread = true
  -- Reduce CursorHold delay for faster detection
  vim.o.updatetime = 1000

  setup_autocmds()
  setup_fs_watcher()
end

return M
