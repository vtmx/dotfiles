local usercmd = vim.api.nvim_create_user_command

local M = {}

function M.toggle_autocomplete()
  if vim.o.autocomplete then
    vim.o.autocomplete = false
    vim.notify('Disable auto-complete')
  else
     vim.o.autocomplete = true
    vim.notify('Enable auto-complete')
  end
end

vim.g.minicursorword_disable = true

function M.toggle_cursorword()
  vim.g.minicursorword_disable = not vim.g.minicursorword_disable
  vim.notify('Cursorword ' .. (vim.g.minicursorword_disable and 'off' or 'on'))
end

usercmd('ToggleCursorWord', M.toggle_cursorword, {})

function M.toggle_diagnostic()
  local is_enabled = vim.diagnostic.is_enabled()

  if is_enabled then
    vim.diagnostic.enable(false)
    vim.notify('Diagnostic disable')
  else
    vim.diagnostic.enable(true)
    vim.notify('Diagnostic enable')
  end
end

usercmd('ToggleDiagnostic', M.toggle_diagnostic, {})

function M.toggle_diagnostic_virtual_text()
  local is_signcolumn = vim.wo.signcolumn == 'yes'

  if is_signcolumn then
    vim.opt.signcolumn = 'no'
    vim.diagnostic.config({ signs = false, virtual_text = false })
    vim.notify('Diagnostic virtual text disable')
  else
    vim.opt.signcolumn = 'yes'
    vim.diagnostic.enable(true)
    vim.diagnostic.config({ signs = true, virtual_text = true })
    vim.notify('Diagnostic virtual text enable')
  end
end

usercmd('ToggleDiagnosticVirtualText', M.toggle_diagnostic_virtual_text, {})

function M.toggle_diary()
  M.toggle_number()
  M.toggle_spelllang()
  M.toggle_wrap()
  vim.cmd('highlight CursorLine NONE')
  vim.keymap.set({'v'}, 'j', 'gj')
  vim.keymap.set({'v'}, 'k', 'gk')
  vim.keymap.set({'n', 'v'}, 'H', 'g^')
  vim.keymap.set({'n', 'v'}, 'L', 'g$')
  vim.notify('Toggle diary')
end

usercmd('ToggleDiary', M.toggle_diary, {})

function M.toggle_document_color()
  if vim.lsp.document_color.is_enabled() then
    vim.lsp.document_color.enable(false)
    vim.notify('Disable document color')
  else
    vim.lsp.document_color.enable(true, nil, { style = 'virtual' })
    vim.notify('Enable document color')
  end
end

usercmd('ToggleDocumentColor', M.toggle_document_color, {})

vim.g.codeium_enabled = false

function M.toggle_ia()
  if vim.g.codeium_enabled == true then
    vim.cmd('Codeium Disable')
    vim.notify('Disable IA')
  else
    vim.cmd('Codeium Enable')
    vim.notify('Enable IA')
  end
end

usercmd('ToggleIA', M.toggle_ia, {})

function M.toggle_number()
  if vim.o.number then
    vim.o.number = false
    vim.o.relativenumber = false
    vim.notify('Disable number')
  else
    vim.o.number = true
    vim.o.relativenumber = true
    vim.notify('Enable number')
  end
end

usercmd('ToggleNumber', M.toggle_number, {})

function M.toggle_colorcolumn()
  if vim.o.colorcolumn == '' then
    vim.o.colorcolumn = '80'
    vim.notify('Enable colorcolumn')
  else
    vim.o.colorcolumn = ''
    vim.notify('Disable colorcolumn')
  end
end

usercmd('ToggleColorColumn', M.toggle_colorcolumn, {})

function M.toggle_relativenumber()
  vim.o.relativenumber = not vim.o.relativenumber
  vim.notify('Relative number ' .. (vim.o.relativenumber and 'on' or 'off'))
end

usercmd('ToggleRelativeNumber', M.toggle_relativenumber, {})

function M.toggle_listchars()
  vim.o.list = not vim.o.list
  vim.notify('List ' .. (vim.o.list and 'on' or 'off'))
end

usercmd('ToggleListChars', M.toggle_listchars, {})

vim.g.minipairs_disable = true

function M.toggle_pairs()
  vim.g.minipairs_disable = not vim.g.minipairs_disable
  vim.notify('Pairs ' .. (vim.g.minipairs_disable and 'off' or 'on'))
end

usercmd('TogglePairs', M.toggle_pairs, {})

function M.toggle_spelllang()
  if vim.o.spelllang == 'en' then
    vim.o.spelllang = 'pt'
    vim.o.spell = true
    vim.notify('Enable spelllang pt')
  else
    vim.o.spelllang = 'en'
    vim.o.spell = false
    vim.notify('Disable spellang')
  end
end

usercmd('ToggleSpellLang', M.toggle_spelllang, {})


function M.toggle_treesitter()
  local bufnr = vim.api.nvim_get_current_buf()
  local ts_highlighter = vim.treesitter.highlighter
  local is_active = ts_highlighter and ts_highlighter.active[bufnr] ~= nil

  if is_active then
    vim.treesitter.stop(bufnr)
    vim.notify('Treesitter stop')
  else
    local ft = vim.bo[bufnr].filetype
    if ft and ft ~= "" then
      local success, _ = pcall(vim.treesitter.start, bufnr, ft)
      if success then
        vim.notify('Treesitter start')
      else
        vim.notify('Treesitter error ' .. ft)
      end
    else
      vim.notify('Treesitter not found file type')
    end
  end
end

usercmd('ToggleTreesitter', M.toggle_treesitter, {})

function M.toggle_wrap()
  if vim.wo.wrap then
    vim.wo.wrap = false
    vim.wo.linebreak = false
    vim.wo.breakindent = false
    vim.notify('Wrap disable')
  else
    vim.wo.wrap = true
    vim.wo.linebreak = true
    vim.wo.breakindent = true
    vim.notify('Wrap enable')
  end
end

usercmd('ToggleWrap', M.toggle_wrap, {})

-- function M.is_netrw_open()
--   for _, buf in ipairs(vim.api.nvim_list_bufs()) do
--     if vim.api.nvim_buf_get_option(buf, 'filetype') == 'netrw' then
--       return true
--     end
--   end
--   return false
-- end
--
-- function M.close_netrw()
--   for _, buf in ipairs(vim.api.nvim_list_bufs()) do
--     if vim.api.nvim_buf_get_option(buf, 'filetype') == 'netrw' then
--       vim.api.nvim_buf_delete(buf, { force = true })
--       vim.notify('Netrw has been closed')
--       return
--     end
--   end
--   vim.notify('Netrw is not open')
-- end
--
-- function M.toggle_ex()
--   if M.is_netrw_open() then
--     M.close_netrw()
--   else
--     vim.cmd('Ex')
--   end
-- end
--
-- usercmd('ToggleEx', M.toggle_ex, {})
--
-- function M.toggle_lex()
--   if M.is_netrw_open() then
--     M.close_netrw()
--   else
--     vim.cmd('Lex')
--   end
-- end
--
-- usercmd('ToggleLex', M.toggle_lex, {})

return M
