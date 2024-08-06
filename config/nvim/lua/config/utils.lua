local M = {}

-- Toggle line command
function M.toggle_cmdheight()
  if vim.o.cmdheight == 1 then
    vim.opt.cmdheight = 0
    print('Disable cmdheight')
  else
    vim.opt.cmdheight = 1
    print('Enable cmdheight')
  end
end

-- Toggle IA
function M.toggle_ia()
  if vim.cmd('CodeiumToggle') then
    print('Toggle Codeium')
  end
end

-- Toggle number column
function M.toggle_number()
  if vim.o.number then
    vim.opt.number = false
    vim.opt.relativenumber = false
    print('Disable number')
  else
    vim.opt.number = true
    vim.opt.relativenumber = true
    print('Enable number')
  end
end

-- Toggle relative number
function M.toggle_relativenumber()
  if vim.o.relativenumber then
    vim.opt.relativenumber = false
    print('Disable relative number')
  else
    vim.opt.relativenumber = true
    print('Enable relative number')
  end
end

-- Toggle list chars
function M.toggle_listchars()
  if vim.o.list then
    vim.opt.list = false
    print('Disable list chars')
  else
    vim.opt.list = true
    print('Enable list chars')
  end
end

-- Toggle list spell
function M.toggle_spell()
  vim.wo.spell = not vim.wo.spell

  if vim.wo.spell then
    print('Enable spell')
  else
    print('Disable spell')
  end
end

-- Toggle wrap
function M.toggle_wrap()
  if vim.wo.wrap then
    vim.wo.wrap = false
    vim.wo.linebreak = false
    print('Disable wrap')
  else
    vim.wo.wrap = true
    vim.wo.linebreak = true
    print('Enable wrap')
  end
end

return M
