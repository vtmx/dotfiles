local function add_syntax(pattern, src)
  vim.api.nvim_create_autocmd('FileType', {
    pattern = pattern,
    once = true,
    callback = function() vim.pack.add({ src }) end
  })
end

add_syntax({ 'sxhkdrc', 'shortcuts' }, 'https://github.com/baskerville/vim-sxhkdrc')
