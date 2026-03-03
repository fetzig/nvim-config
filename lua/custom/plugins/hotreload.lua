-- Loader for the hotreload module (auto-imported by lazy.nvim via custom/plugins/)
return {
  dir = vim.fn.stdpath 'config' .. '/lua/custom',
  name = 'hotreload',
  lazy = false,
  priority = 100,
  config = function()
    require('custom.hotreload').setup()
  end,
}
