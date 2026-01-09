return {
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    config = true
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local servers = {
        'bashls',
        'emmet-language-server',
        'cssls',
        'html',
        'lua_ls'
      }

      -- Configurações globais
      vim.lsp.config("*", {
        winbar = "%{%v:lua.require'nvim-navic'.get_location()%}",
        window = {
          border = 'rounded',
        },
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

      -- Emmet Language Server
      vim.lsp.config('emmet-language-server', {
        cmd = { 'emmet-language-server', '--stdio' },
        filetypes = { 'html', 'css', 'scss' },
        showAbbreviationSuggestions = true,
        showExpandedAbbreviation = 'always',
        showSuggestionsAsSnippets = false,
      })

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

      -- Activate servers
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
          prefix = ''
        }
      })
    end
  }
}
