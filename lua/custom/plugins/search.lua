-- search.lua
--
-- Advanced search and replace functionality using nvim-spectre
--
return {
  -- nvim-spectre - Find and replace with live preview
  {
    'nvim-pack/nvim-spectre',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      {
        '<leader>sR',
        '<cmd>lua require("spectre").toggle()<cr>',
        desc = '[S]earch/[R]eplace (Spectre)',
      },
      {
        '<leader>sW',
        '<cmd>lua require("spectre").open_visual({select_word=true})<cr>',
        desc = '[S]earch current [W]ord (Spectre)',
      },
      {
        '<leader>sp',
        '<cmd>lua require("spectre").open_file_search({select_word=true})<cr>',
        desc = '[S]earch in current file (Spectre)',
      },
      -- Visual mode: search selected text
      {
        '<leader>sR',
        '<esc><cmd>lua require("spectre").open_visual()<cr>',
        mode = 'v',
        desc = '[S]earch/[R]eplace selection (Spectre)',
      },
    },
    opts = {
      -- Use mostly default settings for stability
      -- Spectre will use its built-in keybindings which are shown in the UI
    },
  },
}
