return {
  'Exafunction/codeium.vim',
  cmd = 'Codeium',
  config = function ()
    vim.keymap.set('i', '<c-e>', function() return vim.fn['codeium#Clear']() end, { expr = true })
    vim.keymap.set('i', '<c-j>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
    vim.keymap.set('i', '<c-k>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
    vim.keymap.set('i', '<c-n>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
    vim.keymap.set('i', '<c-p>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
    vim.keymap.set('i', '<c-y>', function() return vim.fn['codeium#Accept']() end, { expr = true })
    vim.keymap.set('i', '<tab>', function() return vim.fn['codeium#Accept']() end, { expr = true })
  end
}
