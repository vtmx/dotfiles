vim.pack.add({
  'https://github.com/williamboman/mason.nvim',
  'https://github.com/neovim/nvim-lspconfig',
})

require('mason').setup({
  ui = { border = 'rounded' }
})

-- Global
vim.lsp.config('*', {
  winbar = "%{%v:lua.require'nvim-navic'.get_location()%}",
  window = { border = 'rounded' },
})

-- BashLS
vim.lsp.config('bashls', {
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'bash', 'sh' },
  settings = {
    bashIde = {
      globPattern = '*@(.sh|.inc|.bash|.command)',
      shellcheckArguments = '-e SC2086'
    }
  }
})
vim.lsp.enable('bashls')

-- CSS
vim.lsp.config('cssls', {
  cmd = { 'vscode-css-language-server', '--stdio' },
  filetypes = { 'css', 'scss' },
  settings = {
    css = {
      validate = true,
      lint = { unknownAtRules = 'warning' },
    },
    scss = { validate = true },
  }
})
vim.lsp.enable('cssls')

vim.lsp.config('emmet_ls', {
  cmd = { 'emmet-ls', '--stdio' },
  filetypes = { 'css', 'scss', 'html' },
  init_options = {
    showAbbreviationSuggestions = true,
    showExpandedAbbreviation = 'always',
  }
})
vim.lsp.enable('emmet_ls')

-- HTML
vim.lsp.config('html', {
  cmd = { 'vscode-html-language-server', '--stdio' },
  filetypes = { 'html' },
  settings = {
    html = {
      format = {
        templating = true,
        wrapAttributes = 'auto',
      },
      hover = {
        documentation = true,
        references = true,
      },
      suggest = {
        html5 = true,
      },
    },
  },
  -- Snippet support (pra completions mais ricas, se usar nvim-cmp)
  capabilities = vim.lsp.protocol.make_client_capabilities(),
})
vim.lsp.enable('html')

-- Lua
vim.lsp.config('lua_ls', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
      runtime = { version = 'LuaJIT' }
    }
  }
})
vim.lsp.enable('lua_ls')

-- Desativar diagnostico global
vim.diagnostic.config({
  signs = false,
  virtual_lines = false,
  virtual_text = false,
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = ''
  }
})

-- Ativa módulo de cores
vim.lsp.document_color.enable(false)
