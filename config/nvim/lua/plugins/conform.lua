vim.pack.add({ 'https://github.com/stevearc/conform.nvim' })

require('conform').setup({
	formatters_by_ft = {
		lua = { 'stylua' },
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
