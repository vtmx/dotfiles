-- Vars
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local filetype_group = augroup('user_filetype', { clear = true })

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
        local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
        vim.api.nvim_buf_set_lines(0, row, row, false, lines)
        vim.api.nvim_win_set_cursor(0, { row + 2, 0 })
        vim.cmd('startinsert')
      end)
    end, { buffer = true })

    vim.keymap.set('i', '``', function()
      vim.snippet.expand('```$1\n$2\n```\n\n$3')
    end, { buffer = true })

    vim.keymap.set('i', '**', function()
      vim.snippet.expand('**$1** $0')
    end, { buffer = true })

    vim.keymap.set('i', '![', function()
      vim.snippet.expand('![$1]($2) $0')
    end, { buffer = true })

    vim.keymap.set('i', '<c-k>', function()
      vim.snippet.expand('[$1]($0)')
    end, { buffer = true })

    vim.keymap.set('i', '<c-t>', function()
      vim.snippet.expand('|$0|')
    end, { buffer = true })
  end
})
