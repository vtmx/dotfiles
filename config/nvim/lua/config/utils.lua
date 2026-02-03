local M = {}

function M.map(mode, lhs, rhs, opts)
  if opts.silent == nil then
    opts.silent = true
  end
  vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.minicursorword_disable = true

function M.toggle_cursorword()
  vim.g.minicursorword_disable = not vim.g.minicursorword_disable
  print('Cursorword ' .. (vim.g.minicursorword_disable and 'off' or 'on'))
end

function M.toggle_diagnostic()
  if vim.diagnostic.is_enabled() then
    vim.o.signcolumn = 'no'
		vim.diagnostic.enable(false)
    print('Diagnostic disable')
	else
    vim.o.signcolumn = 'yes'
		vim.diagnostic.enable(true)
    print('Diagnostic enable')
	end
end

function M.toggle_diary()
  M.toggle_number()
  M.toggle_spelllang()
  M.toggle_wrap()
  vim.cmd('highlight CursorLine NONE')
  vim.keymap.set({'v'}, 'j', 'gj')
  vim.keymap.set({'v'}, 'k', 'gk')
  vim.keymap.set({'n', 'v'}, 'H', 'g^')
  vim.keymap.set({'n', 'v'}, 'L', 'g$')
  print('Toggle diary')
end

vim.g.codeium_enabled = false

function M.toggle_ia()
  if vim.g.codeium_enabled == true then
    vim.cmd('Codeium Disable')
    print('Codeium off')
  else
    vim.cmd('Codeium Enable')
    print('Codeium: on')
  end
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
  vim.o.relativenumber = not vim.o.relativenumber
  print('Relative number ' .. (vim.o.relativenumber and 'off' or 'on'))
end

function M.toggle_listchars()
  vim.o.list = not vim.o.list
  print('List ' .. (vim.o.list and 'on' or 'off'))
end

vim.g.minipairs_disable = true

function M.toggle_pairs()
  vim.g.minipairs_disable = not vim.g.minipairs_disable
  print('Pairs ' .. (vim.g.minipairs_disable and 'off' or 'on'))
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
      print('Netrw has been closed')
      return
    end
  end
  print('Netrw is not open')
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
