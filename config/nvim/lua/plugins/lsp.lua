vim.pack.add({
  'https://github.com/williamboman/mason.nvim',
  'https://github.com/neovim/nvim-lspconfig',
})

require('mason').setup({
  ui = {
    keymaps = {
      install_package = 'i',
      uninstall_package = 'u',
      update_package = 'I',
      update_all_packages = 'U',
      check_package_version = 'c',
      check_outdated_packages = 'C',
    }
  }
})

local function lsp(name, config)
  vim.lsp.config(name, config)
  vim.lsp.enable(name)
end

-- bash
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

-- c
lsp('clangd', {
  cmd = { 'clangd' },
  filetypes = { 'c' },
})

-- emmet
lsp('emmet_language_server', {
  cmd = { 'emmet-language-server', '--stdio' },
  filetypes = { 'css', 'scss', 'html' },
  init_options = {
    showSuggestionsAsSnippets = true,
  }
})

-- go
lsp('gopls', {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod' },
})

-- lua
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

-- Ativa auto-complete
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end
})
