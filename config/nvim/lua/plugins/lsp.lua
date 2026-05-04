vim.pack.add({
  'https://github.com/williamboman/mason.nvim',
  'https://github.com/neovim/nvim-lspconfig',
})

require('mason').setup({
  ui = { border = 'rounded' }
})

local function lsp(name, config)
  vim.lsp.config(name, config)
  vim.lsp.enable(name)
end

-- Global
vim.lsp.config('*', {
  window = { border = 'rounded' },
})

-- Bash
lsp('bashls', {
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'bash', 'sh' },
  settings = {
    bashIde = {
      globPattern = '*@(.sh|.inc|.bash|.command)',
      shellcheckArguments = { '-e SC2086' },
    }
  }
})

-- CSS
lsp('cssls', {
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

lsp('emmet_ls', {
  cmd = { 'emmet-ls', '--stdio' },
  filetypes = { 'css', 'scss', 'html' },
  init_options = {
    showAbbreviationSuggestions = true,
    showExpandedAbbreviation = 'always',
  }
})

-- Go
lsp('gopls', {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
})

-- HTML
lsp('html', {
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
})

-- Lua
lsp('lua_ls', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
      runtime = { version = 'LuaJIT' },
    }
  }
})

-- Desativar diagnostico global
vim.diagnostic.config({
  signs = false,
  virtual_lines = false,
  virtual_text = false,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  }
})

-- Desativa módulo de cores padrão (chato)
vim.lsp.document_color.enable(false)
