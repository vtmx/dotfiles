-- Vars
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local filetype_group = augroup('user_filetype', { clear = true })

local function map(modes, lhs, rhs, opts)
  opts = opts or {}
  opts.buffer = true
  if type(modes) == 'string' then modes = { modes } end
  for _, mode in ipairs(modes) do
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- set bash if shebang
autocmd({ 'BufRead', 'BufNewFile' }, {
  group = filetype_group,
  pattern = '*',
  callback = function(ev)
    if vim.bo[ev.buf].filetype == '' then
      local first_line = vim.api.nvim_buf_get_lines(ev.buf, 0, 1, false)[1] or ''
      if first_line:match('^#!.*bin/(env%s+)?(bash|sh)') then
        vim.bo[ev.buf].filetype = 'bash'
      end
    end
  end
})

-- bash
autocmd('FileType', {
  group = filetype_group,
  pattern = { 'bash', 'sh', 'yad' },
  callback = function()
    map('n', '<leader><cr>', function()
      local file = vim.fn.expand('%:p')
      local cmd = string.format(
        [[tmux display-popup -w 50%% -h 50%% -E "bash -c '%s'; echo; read -p 'Press ENTER or type command to continue'"]], file
      )
      vim.fn.system(cmd)
    end)
    map('i', '[[', function()
      vim.snippet.expand('[[ $0 ]]')
    end)
  end
})

-- css
autocmd('FileType', {
  group = filetype_group,
  pattern = { 'css', 'scss' },
  callback = function()
    map('i', 'var', function()
      vim.snippet.expand('var(--$0)')
    end)
  end
})

-- html
autocmd('FileType', {
  group = filetype_group,
  pattern = { 'html', 'htmldjango' },
  callback = function()
    vim.bo.omnifunc = 'htmlcomplete#CompleteTags'
    map('i', '{{', function()
      vim.snippet.expand('{{ $0 }}')
    end)
    map('i', '{%', function()
      vim.snippet.expand('{% $0 %}')
    end)
  end
})

-- markddown
autocmd('FileType', {
  group = filetype_group,
  pattern = 'markdown',
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2

    map('n', '<leader>`', function()
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
        local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
        vim.api.nvim_buf_set_lines(0, row, row, false, lines)
        vim.api.nvim_win_set_cursor(0, { row + 2, 0 })
        vim.cmd('startinsert')
      end)
    end)

    map('i', '``', function()
      vim.snippet.expand('```$1\n$2\n```')
    end)

    map('i', '**', function()
      vim.snippet.expand('**$1** $0')
    end)

    map('i', '![', function()
      vim.snippet.expand('![$1]($2) $0')
    end)

    map('i', '<c-k>', function()
      vim.snippet.expand('[$1]($0)')
    end)

    map('i', '<c-t>', function()
      vim.snippet.expand('|$0|')
    end)
  end
})
