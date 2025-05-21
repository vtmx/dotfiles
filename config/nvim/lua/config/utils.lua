local M = {}

function M.map(mode, lhs, rhs, opts)
  if opts.silent == nil then
    opts.silent = true
  end
  vim.keymap.set(mode, lhs, rhs, opts)
end

function M.toggle_pairs()
  if vim.g.minipairs_disable then
    vim.g.minipairs_disable = false
    print('Enable pairs')
  else
    vim.g.minipairs_disable = true
    print('Disable pairs')
  end
end

function M.toggle_ia()
  if vim.cmd('CodeiumToggle') then
    print('Toggle ia')
  end
end

function M.toggle_diary()
  M.toggle_colorcolumn()
  M.toggle_number()
  M.toggle_spelllang()
  M.toggle_wrap()
  vim.cmd('highlight CursorLine NONE')
  print('Toggle diary')
end

function M.toggle_number()
  if vim.o.number then
    vim.o.number = false
    vim.o.relativenumber = false
    print('Disable number')
  else
    vim.o.number = true
    vim.o.relativenumber = true
    print('Enable number')
  end
end

function M.toggle_colorcolumn()
  if vim.o.colorcolumn == '' then
    vim.o.colorcolumn = '80'
    print('Enable colorcolumn')
  else
    vim.o.colorcolumn = ''
    print('Disable colorcolumn')
  end
end

function M.toggle_relativenumber()
  if vim.o.relativenumber then
    vim.o.relativenumber = false
    print('Disable relative number')
  else
    vim.o.relativenumber = true
    print('Enable relative number')
  end
end

function M.toggle_listchars()
  if vim.o.list then
    vim.o.list = false
    print('Disable list chars')
  else
    vim.o.list = true
    print('Enable list chars')
  end
end

function M.toggle_spelllang()
  if vim.o.spelllang == 'en' then
    vim.o.spelllang = 'pt'
    vim.o.spell = true
    print('Enable spelllang pt')
  else
    vim.o.spelllang = 'en'
    vim.o.spell = false
    print('Disable spellang')
  end
end

function M.toggle_wrap()
  if vim.wo.wrap then
    vim.wo.wrap = false
    vim.wo.linebreak = false
    vim.wo.breakindent = false
    print('Disable wrap')
  else
    vim.wo.wrap = true
    vim.wo.linebreak = true
    vim.wo.breakindent = true
    print('Enable wrap')
  end
end

function M.is_netrw_open()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_option(buf, 'filetype') == 'netrw' then
      return true
    end
  end
  return false
end

function M.close_netrw()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_option(buf, 'filetype') == 'netrw' then
      vim.api.nvim_buf_delete(buf, { force = true })
      print('Netrw has been closed.')
      return
    end
  end
  print('Netrw is not open.')
end

function M.toggle_netrw_ex()
  if M.is_netrw_open() then
    M.close_netrw()
  else
    vim.cmd('Ex')
  end
end

function M.toggle_netrw_lex()
  if M.is_netrw_open() then
    M.close_netrw()
  else
    vim.cmd('Lex')
  end
end

return M
