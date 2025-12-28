
return {
  'folke/which-key.nvim',
  cmd = 'WhichKey',
  enabled = true,

  opts = {
    plugins = {
      marks = false,
      registers = false,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = false,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = false,
      },
    },
    operators = { gc = 'Comments' },
    key_labels = {
      ['<space>'] = 'SPC',
      ['<cr>'] = 'CR',
      ['<tab>'] = 'TAB',
    },
    motions = {
      count = true,
    },
    icons = {
      breadcrumb = 'Â»',
      group = '+',
    },
    popup_mappings = {
      scroll_down = '<c-d>',
      scroll_up = '<c-u>',
    },
    window = {
      border = 'none',
      position = 'bottom',
      margin = { 1, 0, 1, 0 },
      padding = { 1, 2, 1, 2 },
      winblend = 0,
      zindex = 1000,
    },
    layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 3,
      align = 'left',
    },
    ignore_missing = false,
    hidden = {
      '<silent>',
      '<cmd>',
      '<Cmd>',
      '<CR>',
      '^:',
      '^ ',
      '^call ',
      '^lua ',
      '1v',
    },
    show_help = true,
    show_keys = true,
    triggers = 'auto',
    triggers_nowait = {
      '`',
      "'",
      'g`',
      "g'",
      '"',
      '<c-r>',
      'z=',
    },
    triggers_blacklist = {
      i = { 'j', 'k' },
      v = { 'j', 'k' },
    },
    disable = {
      buftypes = {},
      filetypes = {},
    },
    defaults = {
      mode = { 'n', 'v' },
      ['g'] = { name = '+goto' },
      ['gs'] = { name = '+surround' },
      [']'] = { name = '+next' },
      ['['] = { name = '+prev' },
      ['<leader>b'] = { name = '+buffer' },
      ['<leader>c'] = { name = '+code' },
      ['<leader>f'] = { name = '+file/find' },
      ['<leader>G'] = { name = '+git' },
      ['<leader>l'] = { name = '+Lazy' },
      ['<leader>n'] = { name = '+Neovim' },
      ['<leader>z'] = { name = '+Zsh' },
      ['<leader>u'] = { name = '+ui' },
      ['<leader>h'] = { name = '+Harpoon' },
      ['<leader>s'] = { name = '+Select' },
    },
  },
  config = function(_, opts)
    local wk = require('which-key')
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}

