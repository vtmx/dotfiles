local M = {}

-- Function for mapping
function M.map(mode, lhs, rhs, opts)
  local opts = opts or { silent = true }
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Toggle line command
function M.toggle_cmdheight()
  if vim.o.cmdheight == 1 then
    vim.opt.cmdheight = 0
  else
    vim.opt.cmdheight = 1
  end
end

-- Toggle number column
function M.toggle_number()
  if vim.o.number then
    vim.opt.number = false
    vim.opt.relativenumber = false
  else
    vim.opt.number = true
    vim.opt.relativenumber = true
  end
end

-- Toggle relative number
function M.toggle_relativenumber()
  if vim.o.relativenumber then
    vim.opt.relativenumber = false
  else
    vim.opt.relativenumber = true
  end
end

-- Toggle list chars
function M.toggle_listchars()
  if vim.o.list then
    vim.opt.list = false
  else
    vim.opt.list = true
  end
end

-- Toggle list spell
function M.toggle_spell()
  vim.wo.spell = not vim.wo.spell 
end

-- Toggle wrap
function M.toggle_wrap()
  vim.wo.wrap = not vim.wo.wrap
end

return M
