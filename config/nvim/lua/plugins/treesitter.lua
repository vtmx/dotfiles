return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    autotag = {
      enable = true
    },
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
    },
    highlight = {
      enable = true
    },
    indent = {
      enable = true
    }
  }
}
