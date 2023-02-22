return {
  'folke/zen-mode.nvim',
  dependencies = {
    'folke/twilight.nvim',
  },
  keys = {
    { '<leader>z', '<cmd>ZenMode<cr> <cmd>set wrap<cr> <cmd>set linebreak<cr>' },
  },
  config = function() 
    require('zen-mode').setup({
      window = {
        width = 80,
        options = {
          cursorline = false,
          number = false,
          relativenumber = false,
        }
      },
      plugins = {
        twilight = { enabled = true },
        kitty = {
          enabled = true,
          font = "+4",
        },
      }
    })
  end
}
