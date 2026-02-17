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

-- Restore cursor position
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
  pattern = { '.conf', '.config', '.env', '.env.*' },
  callback = function()
    vim.bo.filetype = 'dosini'
  end
})

-- Trim whitespace on save
autocmd('BufWritePre', {
  pattern = '*',
  command = '%s/\\s\\+$//e'
})

-- Close help with 'q'
autocmd('FileType', {
  pattern = { 'help', 'lspinfo', 'man', 'startuptime', 'qf' },
  callback = function()
    vim.keymap.set('n', 'q', '<cmd>bd<cr>', { desc = 'Close file' })
    vim.cmd('wincmd L')
    vim.cmd('only')
  end
})

-- Close history mode whit 'q'
autocmd('CmdwinEnter', {
  callback = function()
    vim.keymap.set('n', 'q', '<C-W>c', { buffer = true })
  end
})

-- bash
autocmd('FileType', {
  pattern = { 'bash', 'sh' },
  callback = function()
    vim.keymap.set('i', '[[', function()
      vim.snippet.expand('[[ $1 ]]$0')
    end)
  end
})

-- css
autocmd('FileType', {
  pattern = { 'css', 'scss' },
  callback = function()
    vim.keymap.set('i', 'var', function()
      vim.snippet.expand('var(--$0)')
    end)
  end
})

-- html
autocmd('FileType', {
  pattern = 'html',
  callback = function()
    vim.bo.omnifunc = 'htmlcomplete#CompleteTags'

    vim.keymap.set('i', '{{', function()
      vim.snippet.expand('{{ $0 }}')
    end)
  end
})

-- markddown
autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2

    vim.keymap.set('i', '<c-k>', function()
      vim.snippet.expand('[$1]($0)')
    end)

    vim.keymap.set('n', '<leader>`', function()
      vim.snippet.expand('```bash\n$0\n```')
    end)

    vim.keymap.set('i', '`', function()
      vim.snippet.expand('```bash\n$0\n```')
    end)
  end
})

-- lua
autocmd('BufWritePost', {
  pattern = 'theme.lua',
  callback = function()
    vim.cmd('source %')
    print('Reload')
  end
})

-- python
autocmd('FileType', {
  pattern = 'python',
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.softtabstop = 2
  end,
})

-- Set opts in terminal
-- falhando com o fzflua
-- autocmd('TermOpen', {
--   command = 'setlocal listchars= nonumber norelativenumber nocursorline startinsert',
-- })

-- Run by file
exec([[
autocmd BufRead,BufNewFile *.sh nnoremap <c-cr> <cmd>w!<cr> <cmd>exec '!bash' shellescape(@%, 1)<cr>
autocmd BufRead,BufNewFile *.py nnoremap <c-cr> <cmd>w!<cr> <cmd>exec '!python' shellescape(@%, 1)<cr>
]], false)
