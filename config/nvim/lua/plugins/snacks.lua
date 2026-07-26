vim.pack.add({ 'https://github.com/folke/snacks.nvim' })

require('snacks').setup({
  indent = { enabled = true },
  picker = {
    enable  = true,
    exclude = { '.git', 'dist', 'node_modules', 'public' },
    layout = { layout = { backdrop = false } }
  },
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
      backdrop = false,
    },
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
