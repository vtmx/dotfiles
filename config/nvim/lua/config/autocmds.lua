-- Vars
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local exec = vim.api.nvim_exec

-- Disable hightlight when move cursor
autocmd('CursorMoved', {
  group = augroup('auto-hlsearch', { clear = true }),
  callback = function()
    if vim.v.hlsearch == 1 and vim.fn.searchcount().exact_match == 0 then
      vim.schedule(function () vim.cmd.nohlsearch() end)
    end
  end
})

-- Highlight yank
autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ timeout = 100 })
  end
})

-- Disable auto comment
autocmd('FileType', {
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { 'c', 'r', 'o' }
  end
})

-- Close help with "q"
autocmd('FileType', {
    pattern = { 'help', 'lspinfo', 'man', 'startuptime', 'qf' },
    callback = function()
      vim.keymap.set('n', 'q', '<cmd>quit<cr>', { desc = 'Quit doc file' })
    end
  }
)

-- Open help file in left
autocmd('FileType', {
    pattern = { 'help', 'lspinfo', 'man', 'startuptime', 'qf' },
    command = 'wincmd L'
  }
)

-- Emmet
autocmd('FileType', {
  pattern = { 'css', 'scss', 'html', 'vue' },
  callback = function()
    vim.keymap.set('i', '<c-e>', '<Plug>(emmet-expand-abbr)', { desc = 'Emmet expand' })
  end
})

-- Markdown
autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.keymap.set('i', '<c-b>', '```bash<cr>```<esc>O', { desc = 'Add bashcode' })
    vim.keymap.set('i', '<c-k>', '[]()<left><left><left>', { desc = 'Add link' })
  end
})

-- Set opts in terminal
autocmd('TermOpen', {
  command = 'setlocal listchars= nonumber norelativenumber nocursorline',
})

-- Open terminal in insert mode
autocmd('TermOpen', {
  pattern = '',
  command = 'startinsert'
})

-- Run by file
exec([[
  autocmd BufRead,BufNewFile *.sh nnoremap <c-cr> <cmd>w!<cr> <cmd>exec '!bash' shellescape(@%, 1)<cr>
  autocmd BufRead,BufNewFile *.py nnoremap <c-cr> <cmd>w!<cr> <cmd>exec '!python' shellescape(@%, 1)<cr>
]], false)
