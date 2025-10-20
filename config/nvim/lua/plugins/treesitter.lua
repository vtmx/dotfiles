return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  auto_install = true,
  sync_install = false,
  opts = {
    autotag = { enable = true },
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = { 
      'c', 'bash', 'css', 'help', 'html', 'javascript', 'json',
      'lua', 'markdown', 'markdown_inline', 'python', 'scss', 'sxhkdrc',
      'tmux', 'toml', 'typescript', 'v', 'vim', 'vimdoc', 'vue', 'yaml'
    }
  }
}
