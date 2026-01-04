-- harpoon.lua
--
-- Quick file navigation with Harpoon 2
-- Mark frequently used files and jump between them instantly
--
return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require('harpoon')
      harpoon:setup({
        settings = {
          save_on_toggle = true,
          sync_on_ui_close = true,
        },
      })

      -- Add file to harpoon
      vim.keymap.set('n', '<leader>ma', function()
        harpoon:list():add()
      end, { desc = '[M]ark [A]dd file to harpoon' })

      -- Toggle harpoon quick menu
      vim.keymap.set('n', '<leader>mm', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = '[M]ark [M]enu (harpoon)' })

      -- Navigate to marked files 1-4
      vim.keymap.set('n', '<leader>m1', function()
        harpoon:list():select(1)
      end, { desc = '[M]ark file [1]' })

      vim.keymap.set('n', '<leader>m2', function()
        harpoon:list():select(2)
      end, { desc = '[M]ark file [2]' })

      vim.keymap.set('n', '<leader>m3', function()
        harpoon:list():select(3)
      end, { desc = '[M]ark file [3]' })

      vim.keymap.set('n', '<leader>m4', function()
        harpoon:list():select(4)
      end, { desc = '[M]ark file [4]' })

      -- Navigate next/previous in harpoon list
      vim.keymap.set('n', '<leader>mn', function()
        harpoon:list():next()
      end, { desc = '[M]ark [N]ext file' })

      vim.keymap.set('n', '<leader>mp', function()
        harpoon:list():prev()
      end, { desc = '[M]ark [P]revious file' })
    end,
  },
}
