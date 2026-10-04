vim.pack.add({ 'https://github.com/stevearc/conform.nvim' })

require('conform').setup({
	formatters_by_ft = {
    html = { 'prettier' },
    markdown = { 'prettier' },
    yaml = { 'prettier' },
    css = { 'prettier' },
    scss = { 'prettier' },
    js = { 'prettier' },
    json = { 'prettier' },
    json5 = { 'prettier' },
    jsonc = { 'prettier' },
    typescript = { 'prettier' },
    vue = { 'prettier' },
		lua = { 'stylua' },
    go = { 'gofmt' },
	},
  formatters = {
    stylua = {
      prepend_args = { '--quote-style', 'AutoPreferSingle' },
    },
  },

	-- format_on_save = {
	--   timeout_ms = 500,
	--   lsp_fallback = true,
	-- },
})

-- Active
-- :lua require('conform').format()
