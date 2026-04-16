vim.pack.add({
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    auto_install = false,
    sync_install = false,
    config = function()
      require('nvim-treesitter.configs').setup({
        autotag = { enable = true },
        highlight = {
          enable = true,
          disable = { 'markdown', 'markdown_inline' }
        },
        incremental_selection = { enable = true },
        indent = { enable = false },
        ensure_installed = {
          'c', 'bash', 'css', 'html', 'javascript', 'json',
          'lua', 'python', 'regex', 'scss', 'sxhkdrc', 'tmux',
          'tera', 'toml', 'typescript', 'v', 'vim', 'vimdoc', 'yaml'
        },
      })
    end
  }
})
