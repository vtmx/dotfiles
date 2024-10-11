local M = {}

function M.toggle_ia()
  if vim.cmd('CodeiumToggle') then
    print('Toggle ia')
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

function M.toggle_spell()
  vim.wo.spell = not vim.wo.spell
  if vim.wo.spell then
    print('Enable spell')
  else
    print('Disable spell')
  end
end

function M.toggle_spelllang()
  if vim.o.spelllang == 'en' then
    vim.o.spelllang = 'pt-BR'
    print('Enable spell')
  else
    vim.o.spelllang = 'en'
    print('Disable spell')
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

return M
