return {
  {
    'nvim-lua/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<c-p>',      '<cmd>Telescope find_files<cr>'   },
      { '<leader>F',  '<cmd>Telescope file_browser<cr>' },
      { '<leader>b',  '<cmd>Telescope buffers<cr>'      },
      { '<leader>tc', '<cmd>Telescope commands<cr>'     },
      { '<leader>tg', '<cmd>Telescope git_files<cr>'    },
      { '<leader>m',  '<cmd>Telescope marks<cr>'        },
      { '<leader>tc', '<cmd>Telescope colorscheme<cr>'  },
      { '<leader>tt', '<cmd>Telescope filetypes<cr>'    },
      { '<leader>th', '<cmd>Telescope highlights<cr>'   },
      { '<leader>tk', '<cmd>Telescope keymaps<cr>'      },
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
