vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })
vim.pack.add({ 'https://github.com/baskerville/vim-sxhkdrc' })

-- Install
-- require('nvim-treesitter').install({
--   'bash', 'css', 'html', 'javascript', 'json',
--   'kitty', 'python', 'regex', 'scss', 'sxhkdrc',
--   'tmux', 'tera', 'toml', 'typescript', 'yaml',
-- })

-- Ativação por buffer
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
    if lang then
      pcall(vim.treesitter.start, args.buf)
    end
  end
})

