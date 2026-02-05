return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPre', 'BufNewFile' },
  build = ':TSUpdate',
  auto_install = false,
  sync_install = false,
  config = function()
    require('nvim-treesitter.configs').setup({
      autotag = { enable = true },
      highlight = { enable = true },
      incremental_selection = { enable = true },
      indent = { enable = false },
      ensure_installed = {
        'c', 'bash', 'css', 'html', 'javascript', 'json',
        'lua', 'markdown', 'markdown_inline', 'python', 'scss', 'sxhkdrc',
        'tmux', 'toml', 'typescript', 'v', 'vim', 'vimdoc', 'yaml'
      },
    })
  end
}
