local function add_syntax(pattern, src)
  vim.api.nvim_create_autocmd('FileType', {
    pattern = pattern,
    once = true,
    callback = function() vim.pack.add({ src }) end
  })
end

add_syntax('kitty.conf', 'https://github.com/fladson/vim-kitty')
add_syntax('markdown', 'https://github.com/preservim/vim-markdown')
add_syntax({ 'sxhkdrc', 'shortcuts' }, 'https://github.com/baskerville/vim-sxhkdrc')
add_syntax('toml', 'https://github.com/cespare/vim-toml')
add_syntax('v', 'https://github.com/ollykel/v-vim')
