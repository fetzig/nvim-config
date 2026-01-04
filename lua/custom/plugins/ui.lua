-- ui.lua
--
-- UI enhancements for better development experience
--
return {
  -- Trouble.nvim - Better diagnostics, references, quickfix, and location lists
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = { 'Trouble', 'TroubleToggle' },
    opts = {
      position = 'bottom', -- position of the list can be: bottom, top, left, right
      height = 10, -- height of the trouble list when position is top or bottom
      width = 50, -- width of the list when position is left or right
      icons = true, -- use devicons for filenames
      mode = 'workspace_diagnostics', -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
      fold_open = '', -- icon used for open folds
      fold_closed = '', -- icon used for closed folds
      group = true, -- group results by file
      padding = true, -- add an extra new line on top of the list
      action_keys = {
        close = 'q', -- close the list
        cancel = '<esc>', -- cancel the preview and get back to your last window / buffer / cursor
        refresh = 'r', -- manually refresh
        jump = { '<cr>', '<tab>' }, -- jump to the diagnostic or open / close folds
        open_split = { '<c-x>' }, -- open buffer in new split
        open_vsplit = { '<c-v>' }, -- open buffer in new vsplit
        open_tab = { '<c-t>' }, -- open buffer in new tab
        jump_close = { 'o' }, -- jump to the diagnostic and close the list
        toggle_mode = 'm', -- toggle between "workspace" and "document" diagnostics mode
        toggle_preview = 'P', -- toggle auto_preview
        hover = 'K', -- opens a small popup with the full multiline message
        preview = 'p', -- preview the diagnostic location
        close_folds = { 'zM', 'zm' }, -- close all folds
        open_folds = { 'zR', 'zr' }, -- open all folds
        toggle_fold = { 'zA', 'za' }, -- toggle fold of current file
        previous = 'k', -- previous item
        next = 'j', -- next item
      },
      indent_lines = true, -- add an indent guide below the fold icons
      auto_open = false, -- automatically open the list when you have diagnostics
      auto_close = false, -- automatically close the list when you have no diagnostics
      auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
      auto_fold = false, -- automatically fold a file trouble list at creation
      auto_jump = { 'lsp_definitions' }, -- for the given modes, automatically jump if there is only a single result
      signs = {
        error = '',
        warning = '',
        hint = '',
        information = '',
        other = '',
      },
      use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
    },
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },

  -- Toggleterm.nvim - Better terminal management
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      size = function(term)
        if term.direction == 'horizontal' then
          return 15
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<F12>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      persist_mode = true,
      direction = 'float',
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = 'curved',
        width = function()
          return math.floor(vim.o.columns * 0.9)
        end,
        height = function()
          return math.floor(vim.o.lines * 0.9)
        end,
        winblend = 0,
      },
    },
    keys = {
      { '<F12>', desc = 'Toggle floating terminal' },
      {
        '<leader>Th',
        '<cmd>ToggleTerm size=15 direction=horizontal<cr>',
        desc = '[T]erminal: [H]orizontal',
      },
      {
        '<leader>Tv',
        '<cmd>ToggleTerm size=80 direction=vertical<cr>',
        desc = '[T]erminal: [V]ertical',
      },
      {
        '<leader>Tf',
        '<cmd>ToggleTerm direction=float<cr>',
        desc = '[T]erminal: [F]loating',
      },
    },
  },

  -- Auto Dark Mode - Automatically switch theme based on system appearance
  -- Only enabled on macOS where it can detect system theme changes
  {
    'f-person/auto-dark-mode.nvim',
    enabled = vim.fn.has('mac') == 1, -- Only enable on macOS
    config = function()
      local auto_dark_mode = require('auto-dark-mode')
      auto_dark_mode.setup({
        update_interval = 3000,
        set_dark_mode = function()
          vim.api.nvim_set_option_value('background', 'dark', {})
          vim.cmd('colorscheme catppuccin-mocha')
        end,
        set_light_mode = function()
          vim.api.nvim_set_option_value('background', 'light', {})
          vim.cmd('colorscheme catppuccin-latte')
        end,
      })
      -- Set initial theme on macOS
      auto_dark_mode.init()
    end,
  },
}
