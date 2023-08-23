local c = require('config.colors')

return {
  {
    'olimorris/onedarkpro.nvim',
    lazy = false,
    config = function()
      require('onedarkpro').setup {
        theme = 'onedark',
        colors = {
          bg = c.bgd,
        },
        hlgroups = {
          VertSplit = { bg = c.bgd, fg = c.fgd }
        },
        options = {
          italic = false,
        }
      }
    end
  },
}
