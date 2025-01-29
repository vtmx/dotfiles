return {
  {
    'nvim-lua/telescope.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    cmd = 'Telescope',
    config = function()
      require('telescope').setup({
        defaults = {
          color_devicons = false,
          sorting_strategy = 'ascending',
          prompt_prefix = '   ',
          layout_config = { horizontal = { prompt_position = 'top' } },
          mappings = {
            n = {
              ['<c-c>'] = function(...) return require('telescope.actions').close(...) end
            },
            i = {
              ['<c-j>'] = function(...) return require('telescope.actions').move_selection_next(...) end,
              ['<c-k>'] = function(...) return require('telescope.actions').move_selection_previous(...) end,
              ['<c-c>'] = function(...) return require('telescope.actions').close(...) end
            }
          }
        },
      })
      require('telescope').load_extension('file_browser')
    end
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    cmd = 'Telescope file_browser',
  }
}

