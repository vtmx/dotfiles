return {
  'nvim-treesitter/nvim-treesitter',
  event = 'BufEnter', 
  build = ':TSUpdate',
  opts = {
    autotag = { enable = true },
    highlight = { enable = true },
    indent = { enable = true },
    playground = { enable = true },
    ensure_installed = { 
      'bash',
      'css',
      'fish',
      'help',
      'html',
      'javascript',
      'json',
      'lua',
      'markdown',
      'python',
      'typescript',
      'scss',
      'v',
      'vue',
      'yaml'
    }
  }
}
