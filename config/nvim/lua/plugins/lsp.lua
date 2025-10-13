return {
  {
    'williamboman/mason.nvim', 
    cmd = 'Mason',
    config = true
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')

      lspconfig.emmet_language_server.setup({
        cmd = { 'emmet-language-server', '--stdio' },
        filetypes = { 'html', 'htmldjango', 'css', 'scss' },
      })

      lspconfig.lua_ls.setup({
        cmd = { 'lua-language-server' },
        filetypes = { 'lua' },
      })

      vim.diagnostic.enable(false)
    end
  }
}
