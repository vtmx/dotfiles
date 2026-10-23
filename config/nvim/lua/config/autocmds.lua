-- Vars
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Global Augroups
local general_group = augroup('user_general', { clear = true })
local filetype_group = augroup('user_filetype', { clear = true })

-- Disable hightlight when move cursor
autocmd('CursorMoved', {
  group = general_group,
  callback = function()
    if vim.v.hlsearch == 1 and vim.fn.searchcount().exact_match == 0 then
      vim.schedule(function () vim.cmd.nohlsearch() end)
    end
  end
})

-- Jumps always in center
autocmd('CursorMoved', {
  group = general_group,
  callback = function()
    -- If term or not normal mode
    if vim.bo.buftype == 'terminal' or vim.fn.mode() ~= 'n' then
      return
    end

    -- If paste
    if vim.v.operator == 'p' or vim.v.operator == 'P' then
      return
    end

    local current_line = vim.api.nvim_win_get_cursor(0)[1]
    local last_line = vim.b.last_cursor_line or current_line
    vim.b.last_cursor_line = current_line

    -- If move more of 5 lines go to center
    if math.abs(current_line - last_line) > 5 then
      vim.cmd('normal! zz')
    end
  end
})

-- Text Yank Highlight
autocmd('TextYankPost', {
  group = general_group,
  callback = function()
    if vim.hl and vim.hl.hl_op then -- só funciona >= 0.13
      vim.hl.hl_op({ timeout = 100 })
    else
      (vim.hl.on_yank or vim.highlight.on_yank)({ timeout = 100 })
    end
  end
})

-- Restore cursor position
autocmd('BufReadPost', {
  group = general_group,
  callback = function(args)
    if vim.b[args.buf].cursor_restored then
      return
    end

    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)

    if mark[1] > 0 and mark[1] <= line_count then
      vim.api.nvim_win_set_cursor(0, mark)
      vim.schedule(function()
        vim.cmd('normal! zz')
     end)
    end

    vim.b[args.buf].cursor_restored = true
  end
})

-- Better resize
autocmd('VimResized', {
  group = general_group,
  callback = function()
    vim.cmd('wincmd =')
  end
})

-- Show cursorline only active window enable
autocmd({ 'WinEnter', 'BufEnter' }, {
  group = general_group,
  callback = function()
    vim.opt_local.cursorline = true
  end
})

-- Show cursorline only active window disable
autocmd({ 'WinLeave', 'BufLeave' }, {
  group = general_group,
  callback = function()
    vim.opt_local.cursorline = false
  end
})

-- Disable auto comment
autocmd('FileType', {
  group = filetype_group,
  callback = function()
    vim.opt_local.formatoptions = vim.opt_local.formatoptions:remove({ 'c', 'r', 'o' })
  end
})

-- Syntax highlighting for dotenv files
autocmd('BufRead', {
  group = filetype_group,
  pattern = { '.conf', '.config', '.env', '.env.*' },
  callback = function()
    vim.bo.filetype = 'dosini'
  end
})

-- Trim whitespace when save
autocmd('BufWritePre', {
  group = general_group,
  callback = function()
    local save_cursor = vim.fn.getpos('.')
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos('.', save_cursor)
  end
})

-- Close help with 'q'
autocmd('FileType', {
  group = filetype_group,
  pattern = {
    'checkhealth',
    'gitsigns-blame',
    'help',
    'lspinfo',
    'man',
    'startuptime',
    'qf',
  },
  callback = function()
    vim.keymap.set('n', 'q', '<cmd>bd<cr>')
    vim.cmd('wincmd L')
    vim.cmd('only')
  end
})

-- Close history mode whit 'q'
autocmd('CmdwinEnter', {
  group = general_group,
  callback = function()
    vim.keymap.set('n', 'q', '<C-W>c', { buffer = true })
  end
})

-- bash
autocmd('FileType', {
  group = filetype_group,
  pattern = { 'bash', 'sh', 'yad' },
  callback = function()
    -- Execute script
    vim.keymap.set('n', '<leader><cr>', function()
      local file = vim.fn.expand('%:p')
      local cmd = string.format(
        [[tmux display-popup -w 50%% -h 50%% -E "bash -c '%s'; echo; read -p 'Press ENTER or type command to continue'"]], file
      )
      vim.fn.system(cmd)
    end, { buffer = true })
  end
})

-- css
autocmd('FileType', {
  group = filetype_group,
  pattern = { 'css', 'scss' },
  callback = function()
    vim.keymap.set('i', 'var', function()
      vim.snippet.expand('var(--$0)')
    end, { buffer = true })
  end
})

-- html
autocmd('FileType', {
  group = filetype_group,
  pattern = 'html',
  callback = function()
    vim.bo.omnifunc = 'htmlcomplete#CompleteTags'
    vim.keymap.set('i', '{{', function()
      vim.snippet.expand('{{ $0 }}')
    end, { buffer = true })
    vim.keymap.set('i', '{%', function()
      vim.snippet.expand('{% $0 %}')
    end, { buffer = true })
  end
})

-- markddown
-- https://guidest.com/markdown/shortcuts
autocmd('FileType', {
  group = filetype_group,
  pattern = 'markdown',
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2

    vim.keymap.set('n', '<leader>`', function()
      vim.ui.input({ prompt = 'lang: ' }, function(input)
        if not input or input == '' then
          return
        end

        local lines = {
          '```' .. input,
          '',
          '```'
        }

        -- Pega a posição atual do cursor (linha e coluna, base 0)
        local row, col = unpack(vim.api.nvim_win_get_cursor(0))
        vim.api.nvim_buf_set_lines(0, row, row, false, lines)
        vim.api.nvim_win_set_cursor(0, { row + 2, 0 })
        vim.cmd('startinsert')
      end)
    end, { buffer = true })

    vim.keymap.set('i', '```', function()
      vim.snippet.expand('```\n$0\n```')
    end, { buffer = true })

    vim.keymap.set('i', '<c-b>', function()
      vim.snippet.expand('**$0**')
    end, { buffer = true })

    vim.keymap.set('i', '<c-i>', function()
      vim.snippet.expand('*$0*')
    end, { buffer = true })

    vim.keymap.set('i', '<c-s-i>', function()
      vim.snippet.expand('![$1]($0)')
    end, { buffer = true })

    vim.keymap.set('i', '<c-k>', function()
      vim.snippet.expand('[$1]($0)')
    end, { buffer = true })

    vim.keymap.set('i', '<c-t>', function()
      vim.snippet.expand('|$0|')
    end, { buffer = true })
  end
})

-- lua
autocmd('BufWritePost', {
  pattern = 'onedarkv.lua',
  callback = function()
    vim.cmd('source %')
    print('Reload')
  end
})

autocmd('FileType', {
  group = general_group,
  pattern = 'lua',
  callback = function()
    -- Execute script
    vim.keymap.set('n', '<leader><cr>', function()
      local file = vim.fn.expand('%:p')
      local cmd = string.format(
        [[tmux display-popup -w 50%% -h 50%% -E "lua '%s'; echo; read -p 'Press ENTER or type command to continue'"]], file
      )
      vim.fn.system(cmd)
    end, { buffer = true })
  end
})

-- python
autocmd('FileType', {
  group = filetype_group,
  pattern = 'python',
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2

    -- Execute script
    vim.keymap.set('n', '<leader><cr>', function()
      local file = vim.fn.expand('%:p')
      local cmd = string.format(
        [[tmux display-popup -w 50%% -h 50%% -E "python '%s'; echo; read -p 'Press ENTER or type command to continue'"]], file
      )
      vim.fn.system(cmd)
    end, { buffer = true })
  end
})

-- Set opts in terminal, falhou com o fzflua
autocmd('TermOpen', {
  group = filetype_group,
  callback = function()
    vim.opt_local.listchars = ''
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.cursorline = false
  end
})
