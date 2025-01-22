return {
  'saghen/blink.cmp',
  dependencies = 'rafamadriz/friendly-snippets',
  version = '*',
  opts = {
    keymap = {
      preset = 'default',
      ['<c-j>'] = { 'select_next', 'fallback' },
      ['<c-k>'] = { 'select_prev', 'fallback' },
      ['<tab>'] = { 'select_and_accept' },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
  },
}
