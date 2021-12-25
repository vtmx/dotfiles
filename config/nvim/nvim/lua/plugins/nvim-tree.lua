------------------------------------------------------------
-- nvim-tree
------------------------------------------------------------

vim.g.nvim_tree_quit_on_open = 1

require('nvim-tree').setup({
	auto_close = true,
	disable_netrw = false,
	hijack_netrw = false,
	view = {
		width = 30,
		hide_root_folder = true,
	}
})
