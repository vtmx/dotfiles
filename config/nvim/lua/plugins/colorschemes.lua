local c = require('config.colors')

return {
  {
    'olimorris/onedarkpro.nvim',
    lazy = false,
    config = function()
      require('onedarkpro').setup {
        theme = 'onedark',
        colors = {
          bg = c.bg_dark,
        },
        hlgroups = {
          VertSplit = { bg = c.bg_dark, fg = c.comment }
        },
        options = {
          italic = false,
        }
      }
    end
  },
}
