vim.pack.add({ 'https://github.com/folke/snacks.nvim' })

require('snacks').setup({
  exclude = { '.git', 'dist', 'node_modules', 'public' },
  indent = { enabled = true },
  picker = { enable  = true },
  zen = {
    enable  = true,
    toggles = {
      dim = true,
      cursorline = false,
      number = false,
      relativenumber = false,
    },
    win = {
      width = 0.5,
    },
    zoom = {
      font_size = 4,
    }
  }
})

-- Corrige auto-complete no picker
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'snacks_picker_input',
  callback = function(event)
    vim.o.autocomplete = false
    vim.api.nvim_create_autocmd('BufLeave', {
      buffer = event.buf,
      once = true,
      callback = function()
        vim.o.autocomplete = true
      end
    })
  end
})
