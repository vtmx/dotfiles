return {
  {
    'nvim-lua/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    keys = {
      { '<c-p>',      '<cmd>Telescope file_browser<cr>' },
      { '<leader>tb', '<cmd>Telescope file_browser<cr>' },
      { '<leader>tc', '<cmd>Telescope colorscheme<cr>'  },
      { '<leader>tf', '<cmd>Telescope find_files<cr>'   },
      { '<leader>tl', '<cmd>Telescope filetypes<cr>'    },
      { '<leader>tg', '<cmd>Telescope git_files<cr>'    },
      { '<leader>th', '<cmd>Telescope highlights<cr>'   },
      { '<leader>tk', '<cmd>Telescope keymaps<cr>'      },
      { '<leader>tm', '<cmd>Telescope marks<cr>'        }
    },
    config = function()
      require('telescope').setup({
        defaults = {
          disable_devicons = true,
          color_devicons = false,
          sorting_strategy = 'ascending',
          layout_config = {
            horizontal = {
              prompt_position = 'top'
            }
          },
           mappings = {
            n = {
              ['<c-c>']= function(...) return require('telescope.actions').close(...) end
            },
            i = {
              ['<c-j>'] = function(...) return require('telescope.actions').move_selection_next(...) end,
              ['<c-k>']= function(...) return require('telescope.actions').move_selection_previous(...) end,
              ['<c-c>']= function(...) return require('telescope.actions').close(...) end
            }
          }
        }
      })
      require('telescope').load_extension('file_browser')
    end
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    }
  }
}
