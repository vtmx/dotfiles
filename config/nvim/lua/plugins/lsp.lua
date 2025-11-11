return {
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    config = true
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      -- Configurações globais
      vim.lsp.config("*", {
        winbar = "%{%v:lua.require'nvim-navic'.get_location()%}",
        window = {
          border = "rounded",
        },
      })

      -- BashLS
      vim.lsp.config("bashls", {
        cmd = { 'bash-language-server', 'start' },
        filetypes = { 'bash', 'sh' },
        settings = {
          bashIde = { 
            globPattern = '*@(.sh|.inc|.bash|.command)',
            shellcheckArguments = '-e SC2086' 
          }
        }
      })

      -- Emmet Language Server
      vim.lsp.config("emmet-language-server", {
        cmd = { 'emmet-language-server', '--stdio' },
        filetypes = { 'html', 'htmldjango', 'css', 'scss' },
      })

      -- Lua LS
      vim.lsp.config("lua_ls", {
        cmd = { 'lua-language-server' },
        filetypes = { 'lua' },
        diagnostics = { globals = { 'vim' } },
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim' } },
            runtime = { version = 'LuaJIT' }
          }
        }
      })

      -- Activate servers
      local servers = { 'bashls', 'emmet-language-server', 'lua_ls' }
      for _, server in ipairs(servers) do
        vim.lsp.enable(server)
      end

      -- Desativar diagnostico global
      vim.diagnostic.config({
        virtual_text = false,
        signs = false,
        update_in_insert = true,
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
    end
  }
}
