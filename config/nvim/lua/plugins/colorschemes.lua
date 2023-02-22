local c = require('colors')

return {
  {
    'olimorris/onedarkpro.nvim',
    lazy = true,
    config = function()
      require('onedarkpro').setup {
        theme = 'onedark',
        colors = {
          bg = c.shade0,
        },
        hlgroups = {
          VertSplit = { bg = c.shade0, fg = c.shade3 }
        },
        options = {
          italic = false,
        }
      }
    end
  },
}
