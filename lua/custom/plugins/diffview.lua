return {
  'sindrets/diffview.nvim',
  cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
  keys = {
    { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'Git diff (Diffview)' },
    { '<leader>gh', '<cmd>DiffviewFileHistory<cr>', desc = 'Git file history' },
    { '<leader>gf', '<cmd>DiffviewFileHistory %<cr>', desc = 'Current file history' },
    { '<leader>gq', '<cmd>DiffviewClose<cr>', desc = 'Close Diffview' },
  },
  opts = {
    enhanced_diff_hl = true,
    view = {
      default = { layout = 'diff2_horizontal' },
    },
  },
}
