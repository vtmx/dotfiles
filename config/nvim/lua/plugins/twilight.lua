return {
  'folke/twilight.nvim',
  config = function()
    require('twilight').setup({
      context = 2
    })
  end
}
