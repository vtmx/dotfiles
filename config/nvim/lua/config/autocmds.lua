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

-- Retore cursor position
autocmd('BufReadPost', {
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.api.nvim_win_set_cursor(0, mark)
      vim.schedule(function()
        vim.cmd('normal! zz')
      end)
    end
  end
})

-- Better resize
autocmd('VimResized', {
  command = 'wincmd ='
})

-- Disable auto comment
autocmd('FileType', {
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { 'c', 'r', 'o' }
  end
})

-- Syntax highlighting for dotenv files
autocmd('BufRead', {
  group = vim.api.nvim_create_augroup('dotenv_ft', { clear = true }),
  pattern = { '.env', '.env.*' },
  callback = function()
    vim.bo.filetype = 'dosini'
  end
})

-- Trim whitespace on save
autocmd('BufWritePre', {
  pattern = '*',
  command = '%s/\\s\\+$//e'
})

-- Close help with "q" and open right
autocmd('FileType', {
  pattern = { 'help', 'lspinfo', 'man', 'startuptime', 'qf' },
  callback = function()
    vim.keymap.set('n', 'q', '<cmd>quit<cr>', { desc = 'Quit doc file' })
    vim.cmd('wincmd L')
  end
})

-- CSS
autocmd('FileType', {
  pattern = { 'css', 'scss', 'html' },
  callback = function()
    vim.keymap.set('i', '<c-x>e', '<Plug>(emmet-expand-abbr)', { desc = 'Emmet expand' })
  end
})

-- HTML
autocmd('FileType', {
  pattern = 'html',
  callback = function()
    vim.bo.omnifunc = 'htmlcomplete#CompleteTags'
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

autocmd('FileType', {
  pattern = 'python',
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.softtabstop = 2
  end,
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
