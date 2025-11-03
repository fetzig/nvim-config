-- testing.lua
--
-- Testing configuration using neotest for Python (pytest)
--
return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      -- Test adapters
      'nvim-neotest/neotest-python',
    },
    config = function()
      local neotest = require 'neotest'

      neotest.setup {
        adapters = {
          require 'neotest-python' {
            -- Use pytest as the test runner
            runner = 'pytest',

            -- Python executable (uses project's virtual environment)
            python = function()
              -- Try to find python in .venv first, fallback to system python
              local cwd = vim.fn.getcwd()
              if vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                return cwd .. '/.venv/bin/python'
              end
              return 'python3'
            end,

            -- Arguments for pytest
            args = { '--log-level=DEBUG', '--color=yes', '-vv' },

            -- Enable DAP for debugging tests
            dap = {
              justMyCode = false,
              console = 'integratedTerminal',
            },

            -- Pytest configuration
            pytest_discover_instances = true,
          },
        },

        -- Display settings
        output = {
          enabled = true,
          open_on_run = 'short',
        },

        -- Status icons
        icons = {
          passed = '✓',
          running = '●',
          failed = '✗',
          skipped = '○',
          unknown = '?',
        },

        -- Floating window settings
        floating = {
          border = 'rounded',
          max_height = 0.8,
          max_width = 0.9,
        },

        -- Quickfix settings
        quickfix = {
          enabled = true,
          open = false,
        },

        -- Summary window settings
        summary = {
          enabled = true,
          animated = true,
          follow = true,
          expand_errors = true,
        },
      }
    end,
    keys = {
      {
        '<leader>tt',
        function()
          require('neotest').run.run()
        end,
        desc = '[T]est: Run nearest [t]est',
      },
      {
        '<leader>tf',
        function()
          require('neotest').run.run(vim.fn.expand '%')
        end,
        desc = '[T]est: Run [f]ile',
      },
      {
        '<leader>ta',
        function()
          require('neotest').run.run(vim.fn.getcwd())
        end,
        desc = '[T]est: Run [a]ll tests',
      },
      {
        '<leader>ts',
        function()
          require('neotest').summary.toggle()
        end,
        desc = '[T]est: Toggle [s]ummary',
      },
      {
        '<leader>to',
        function()
          require('neotest').output.open { enter = true, auto_close = true }
        end,
        desc = '[T]est: Show [o]utput',
      },
      {
        '<leader>tO',
        function()
          require('neotest').output_panel.toggle()
        end,
        desc = '[T]est: Toggle [O]utput panel',
      },
      {
        '<leader>tl',
        function()
          require('neotest').run.run_last()
        end,
        desc = '[T]est: Run [l]ast',
      },
      {
        '<leader>td',
        function()
          require('neotest').run.run { strategy = 'dap' }
        end,
        desc = '[T]est: [D]ebug nearest test',
      },
      {
        '<leader>tS',
        function()
          require('neotest').run.stop()
        end,
        desc = '[T]est: [S]top',
      },
      {
        '<leader>tw',
        function()
          require('neotest').watch.toggle()
        end,
        desc = '[T]est: Toggle [w]atch',
      },
    },
  },
}
