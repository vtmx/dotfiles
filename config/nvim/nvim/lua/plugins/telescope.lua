------------------------------------------------------------
-- telescope
------------------------------------------------------------

local actions = require('telescope.actions')

require('telescope').setup({
  defaults = {
		disable_devicons=true,
    mappings = {
      i = {
				['<c-j>'] = actions.move_selection_next,
				['<c-k>'] = actions.move_selection_previous
      }
    }
  }
})
