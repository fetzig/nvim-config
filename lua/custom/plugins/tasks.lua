-- tasks.lua
--
-- Task runner configuration using overseer.nvim
-- Provides integration with justfile commands
--
return {
  {
    'stevearc/overseer.nvim',
    cmd = { 'OverseerRun', 'OverseerToggle', 'OverseerBuild' },
    opts = {
      strategy = {
        'toggleterm',
        direction = 'horizontal',
        open_on_start = true,
      },
      templates = { 'builtin' },
      dap = false,
      task_list = {
        bindings = {
          ['?'] = 'ShowHelp',
          ['g?'] = 'ShowHelp',
          ['<CR>'] = 'RunAction',
          ['<C-e>'] = 'Edit',
          ['o'] = 'Open',
          ['<C-v>'] = 'OpenVsplit',
          ['<C-s>'] = 'OpenSplit',
          ['<C-f>'] = 'OpenFloat',
          ['<C-q>'] = 'OpenQuickFix',
          ['p'] = 'TogglePreview',
          ['<C-l>'] = 'IncreaseDetail',
          ['<C-h>'] = 'DecreaseDetail',
          ['L'] = 'IncreaseAllDetail',
          ['H'] = 'DecreaseAllDetail',
          ['['] = 'DecreaseWidth',
          [']'] = 'IncreaseWidth',
          ['{'] = 'PrevTask',
          ['}'] = 'NextTask',
          ['<C-k>'] = 'ScrollOutputUp',
          ['<C-j>'] = 'ScrollOutputDown',
          ['q'] = 'Close',
        },
      },
    },
    keys = {
      { '<leader>jj', '<cmd>OverseerRun<cr>', desc = '[J]ust: Run task' },
      { '<leader>jt', '<cmd>OverseerToggle<cr>', desc = '[J]ust: Toggle task list' },
      { '<leader>jb', '<cmd>OverseerBuild<cr>', desc = '[J]ust: Build task' },
      {
        '<leader>jd',
        function()
          vim.cmd 'OverseerRun just dev'
        end,
        desc = '[J]ust: Run [d]ev server',
      },
      {
        '<leader>jT',
        function()
          vim.cmd 'OverseerRun just test'
        end,
        desc = '[J]ust: Run [T]ests',
      },
      {
        '<leader>jq',
        function()
          vim.cmd 'OverseerRun just qa'
        end,
        desc = '[J]ust: Run [q]a',
      },
      {
        '<leader>jl',
        function()
          vim.cmd 'OverseerRun just lint'
        end,
        desc = '[J]ust: Run [l]int',
      },
      {
        '<leader>jc',
        function()
          vim.cmd 'OverseerRun just typecheck'
        end,
        desc = '[J]ust: Run type[c]heck',
      },
    },
  },
}
