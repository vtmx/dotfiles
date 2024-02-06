-- Vars
local autocmd = vim.api.nvim_create_autocmd
local exec = vim.api.nvim_exec

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
    command = 'nnoremap <buffer><silent> q :quit<cr>' 
  }
)

-- Open help file in left
autocmd('FileType', {
    pattern = { 'help', 'lspinfo', 'man', 'startuptime', 'qf' },
    command = 'wincmd L' 
  }
)

-- Force markdown to 2 spaces
autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
  end
})

-- Run by file
exec([[
  autocmd BufRead,BufNewFile *.sh nnoremap <c-cr> <cmd>w!<cr> <cmd>exec '!bash' shellescape(@%, 1)<cr>
  autocmd BufRead,BufNewFile *.py nnoremap <c-cr> <cmd>w!<cr> <cmd>exec '!python' shellescape(@%, 1)<cr>
]], false)
