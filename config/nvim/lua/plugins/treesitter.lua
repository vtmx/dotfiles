return {
  'nvim-treesitter/nvim-treesitter',
  event = 'BufEnter', 
  build = ':TSUpdate',
  opts = {
    autotag = { enable = true },
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = { 
      'bash',
      'css',
      'help',
      'html',
      'javascript',
      'json',
      'lua',
      'markdown',
      'python',
      'scss',
      'toml',
      'typescript',
      'v',
      'vue',
      'yaml'
    }
  }
}
