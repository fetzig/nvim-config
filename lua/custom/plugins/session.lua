-- session.lua
--
-- Session management for automatic workspace persistence
--
return {
  -- Auto-session - Automatic session management
  {
    'rmagatti/auto-session',
    lazy = false,
    dependencies = {
      'nvim-telescope/telescope.nvim', -- For session picker
    },
    config = function()
      -- Set sessionoptions before auto-session setup to avoid warnings
      vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

      require('auto-session').setup({
        -- Automatically save session on exit
        auto_save = true,

        -- Automatically restore session on startup
        auto_restore = true,

        -- Auto create session when none exists
        auto_create = true,

        -- Suppress errors when restoring sessions
        suppressed_dirs = {
          '~/',
          '~/Downloads',
          '~/Documents',
          '~/Desktop',
          '/tmp',
        },

        -- Use git root as session directory when in a git repo
        auto_session_use_git_branch = false,

        -- Don't prompt when restoring session
        auto_session_enable_last_session = false,

        -- Session lens configuration for Telescope integration
        session_lens = {
          load_on_setup = true,
          theme_conf = {
            border = true,
          },
          previewer = false,
        },

        -- Pre-save hook to handle special buffers
        pre_save_cmds = {
          'silent! NvimTreeClose', -- Close nvim-tree before saving
        },

        -- Post-restore hook to reopen nvim-tree
        post_restore_cmds = {
          'silent! NvimTreeOpen',
        },

        -- Log level (only show warnings and errors)
        log_level = 'warn',
      })
    end,
    keys = {
      {
        '<leader>Ss',
        '<cmd>Autosession save<cr>',
        desc = '[S]ession: [S]ave',
      },
      {
        '<leader>Sr',
        '<cmd>Autosession restore<cr>',
        desc = '[S]ession: [R]estore',
      },
      {
        '<leader>Sd',
        '<cmd>Autosession delete<cr>',
        desc = '[S]ession: [D]elete',
      },
      {
        '<leader>Sf',
        '<cmd>Telescope session-lens<cr>',
        desc = '[S]ession: [F]ind/Search',
      },
    },
    init = function()
      -- Create a user command to set up the ideal project layout
      vim.api.nvim_create_user_command('ProjectSetup', function()
        -- Close all buffers except current
        vim.cmd('silent! %bdelete')

        -- Ensure a buffer is open
        vim.cmd('enew')

        -- Open nvim-tree on the left
        vim.cmd('NvimTreeOpen')

        -- Focus on the main editing area (move away from nvim-tree)
        vim.cmd('wincmd l')

        -- Create one vertical split to get 2 editor windows side-by-side
        vim.cmd('vsplit')

        -- Distribute windows evenly
        vim.cmd('wincmd =')

        -- Move to the leftmost editor window
        vim.cmd('wincmd h')

        print('Project layout configured! Layout: NvimTree | Buffer 1 | Buffer 2')
        print('Use <F12> to open a floating terminal.')
      end, {
        desc = 'Set up ideal project layout (NvimTree + 2 editor splits)',
      })
    end,
  },
}
