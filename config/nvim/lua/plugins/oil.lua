return {
  {
    'stevearc/oil.nvim',
    cmd = 'Oil',
    config = function()
      require('oil').setup({
        -- Buffer-local options to use for oil buffers
        buf_options = {
          buflisted = false,
          bufhidden = 'hide',
        },
        delete_to_trash = true,
        trash_command = 'trash-put',
        prompt_save_on_select_new_entry = true,
        skip_confirm_for_simple_edits = false,
        float = {
          -- Padding around the floating window
          padding = 3,
          max_width = 70,
          max_height = 30,
          border = 'rounded',
          -- This is the config that will be passed to nvim_open_win.
          -- Change values here to customize the layout
          override = function(conf)
            return conf
          end,
        },
        keymaps = {
          ['g?'] = 'actions.show_help',
          ['<cr>'] = 'actions.select',
          ['<c-enter>'] = 'actions.select_vsplit',
          ['<c-\\>'] = 'actions.select_split', -- this is used to navigate left
          ['<c-t>'] = 'actions.select_tab',
          ['<c-p>'] = 'actions.preview',
          ['q'] = 'actions.close',
          ['<c-c>'] = 'actions.close',
          ['<c-r>'] = 'actions.refresh',
          ['-'] = 'actions.parent',
          ['<c-h>'] = 'actions.parent',
          ['_'] = 'actions.open_cwd',
          ['`'] = 'actions.cd',
          ['~'] = 'actions.tcd',
          ['gs'] = 'actions.change_sort',
          ['gx'] = 'actions.open_external',
          ['g.'] = 'actions.toggle_hidden',
        },
        use_default_keymaps = false,
      })
    end,
  },
}
