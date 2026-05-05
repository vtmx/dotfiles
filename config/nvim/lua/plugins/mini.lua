vim.pack.add({ 'https://github.com/nvim-mini/mini.align' })
require('mini.align').setup()

vim.pack.add({ 'https://github.com/nvim-mini/mini.cursorword' })
require('mini.cursorword').setup()

vim.pack.add({ 'https://github.com/nvim-mini/mini.files' })
require('mini.files').setup({
  mappings = { go_in_plus = '<cr>' },
  options = { use_as_default_explorer = true }
})

vim.pack.add({ 'https://github.com/nvim-mini/mini.jump2d' })
require('mini.jump2d').setup({
  opts = {
    mappings = {
      start_jumping = '',
    },
    view = {
      dim = true
    }
  }
})

vim.pack.add({ 'https://github.com/nvim-mini/mini.pairs' })
require('mini.pairs').setup()

vim.pack.add({ 'https://github.com/nvim-mini/mini.surround' })
require('mini.surround').setup({
  search_method = 'cover_or_nearest',
  mappings = {
    add = 'gsa',
    delete = 'ds',
    replace = 'cs',
    find = '',
    find_left = '',
    highlight = '',
    suffix_last = '',
    suffix_next = ''
  }
})

vim.pack.add({ 'https://github.com/nvim-mini/mini.statusline' })
local statusline = require('mini.statusline')

statusline.setup({
  content = {
    active = function()
      local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
      local git           = statusline.section_git({ trunc_width = 40 })
      local search        = statusline.section_searchcount({ trunc_width = 75 })
      local filename      = statusline.section_filename({ trunc_width = 140 })
      local location      = statusline.section_location({ trunc_width = 75 })

      -- Detecta gravação de macro
      local recording = vim.fn.reg_recording()
      local macro_msg = ''
      if recording ~= '' then
        macro_msg = string.format('⏺')
      end

      local mode_abb = {
        ['Command']  = 'CMD',
        ['Insert']   = 'INS',
        ['Normal']   = 'NOR',
        ['Prompt']   = 'PRO',
        ['Replace']  = 'REP',
        ['S-Block']  = 'SEL',
        ['Select']   = 'SEL',
        ['Shell']    = 'SHE',
        ['S-Line']   = 'SEL',
        ['Terminal'] = 'TER',
        ['V-Block']  = 'VIS',
        ['Visual']   = 'VIS',
        ['V-Line']   = 'VIS',
      }
      mode = mode_abb[mode] or mode

      return statusline.combine_groups({
        { hl = 'Normal', strings = { mode } },
        { hl = 'Comment', strings = { git } }, -- to work { 'lewis6991/gitsigns.nvim', config = true },
        '%<', -- Mark general truncate point
        { hl = 'Comment', strings = { '%t' } },
        '%=', -- End left alignment
        { hl = 'Normal', strings = { search } },
        { hl = 'MiniStatuslineRecording', strings = { macro_msg } },
        { hl = 'Comment',strings = { '%l:%c' } },
      })
    end,
    inactive = nil,
  }
})
