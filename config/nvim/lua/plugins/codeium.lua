return {
  'Exafunction/codeium.vim',
  cmd = 'Codeium',
  -- event = 'InsertEnter',
  config = function ()
    vim.keymap.set('i', '<c-g>', function() return vim.fn['codeium#Accept']() end, { expr = true })
    vim.keymap.set('i', '<c-.>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
    vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
    vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
    vim.keymap.set('i', '<tab>', function() return vim.fn['codeium#Accept']() end, { expr = true })
  end
}
