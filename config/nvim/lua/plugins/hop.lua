return {
  'phaazon/hop.nvim',
  keys = {
    { '<leader>f', '<cmd>HopChar1<cr>' },
  },
  config = function()
    require('hop').setup()
  end
}
