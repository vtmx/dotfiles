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
    if vim.version().minor >= 11 then
      vim.hl.on_yank({ timeout = 100 })
    else
      vim.highlight.on_yank({ timeout = 100 })
    end
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
  callback = function()
    vim.cmd('wincmd =')
  end
})

-- Show cursorline only active window enable
autocmd({ 'WinEnter', 'BufEnter' }, {
  group = augroup('active_cursorline', { clear = true }),
  callback = function()
    vim.opt_local.cursorline = true
  end
})

-- Show cursorline only active window disable
autocmd({ 'WinLeave', 'BufLeave' }, {
  group = 'active_cursorline',
  callback = function()
    vim.opt_local.cursorline = false
  end
})

-- Disable auto comment
autocmd('FileType', {
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { 'c', 'r', 'o' }
  end
})

-- Syntax highlighting for dotenv files
autocmd('BufRead', {
  group = augroup('dotenv_ft', { clear = true }),
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
  pattern = {
    'checkhealth',
    'gitsigns-blame',
    'help',
    'lspinfo',
    'man',
    'startuptime',
    'qf'
  },
  callback = function()
    vim.keymap.set('n', 'q', '<cmd>bd<cr>')
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
  pattern = { 'bash', 'sh', 'yad' },
  callback = function()
    -- Execute script
    vim.keymap.set('n', '<leader><cr>', function()
      local file = vim.fn.expand('%:p')
      local cmd = string.format(
        [[tmux display-popup -w 50%% -h 50%% -E "bash -c '%s'; echo; read -p 'Press ENTER or type command to continue'"]], file
      )
      vim.fn.system(cmd)
    end)

    -- Auto pair test command
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

    vim.keymap.set('n', '<leader>`', function()
      vim.snippet.expand('```bash\n$0\n```')
    end)

    vim.keymap.set('i', '<c-b>', function()
      vim.snippet.expand('```$1\n$0\n```')
    end)

    vim.keymap.set('i', '<c-k>', function()
      vim.snippet.expand('[$1]($0)')
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

autocmd('FileType', {
  pattern = 'lua',
  callback = function()
    -- Execute script
    vim.keymap.set('n', '<leader><cr>', function()
      local file = vim.fn.expand('%:p')
      local cmd = string.format(
        [[tmux display-popup -w 50%% -h 50%% -E "lua '%s'; echo; read -p 'Press ENTER or type command to continue'"]], file
      )
      vim.fn.system(cmd)
    end)
  end
})

-- python
autocmd('FileType', {
  pattern = 'python',
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.softtabstop = 2

    -- Execute script
    vim.keymap.set('n', '<leader><cr>', function()
      local file = vim.fn.expand('%:p')
      local cmd = string.format(
        [[tmux display-popup -w 50%% -h 50%% -E "python '%s'; echo; read -p 'Press ENTER or type command to continue'"]], file
      )
      vim.fn.system(cmd)
    end)
  end
})

-- Set opts in terminal
-- falhou com o fzflua
autocmd('TermOpen', {
  callback = function()
    vim.opt_local.listchars = ''
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.cursorline = false
    -- vim.cmd('wincmd J')
    -- vim.cmd('startinsert')
  end
})

-- Run by file
-- exec([[
-- autocmd BufRead,BufNewFile *.sh nnoremap <c-cr> <cmd>w!<cr> <cmd>exec '!bash' shellescape(@%, 1)<cr>
-- autocmd BufRead,BufNewFile *.sh nnoremap <c-cr> <cmd>w!<cr> <cmd>exec '!bash' %<cr>
-- autocmd BufRead,BufNewFile *.py nnoremap <c-cr> <cmd>w!<cr> <cmd>exec '!python' shellescape(@%, 1)<cr>
-- ]], false)
