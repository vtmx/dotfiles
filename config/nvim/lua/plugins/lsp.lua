return {
  {
    'williamboman/mason.nvim', 
    cmd = 'Mason',
    config = true
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('lspconfig').emmet_language_server.setup({
        cmd = { 'emmet-language-server', '--stdio' },
        filetypes = { 'html', 'htmldjango', 'css', 'scss' },
      })
    end
  },
}
