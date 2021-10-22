" ------------------------------------------------------------------------------
" Style 
" ------------------------------------------------------------------------------

" theme
syntax on
colo onedark
set bg=dark
set tgc
set guifont=IBMPlexMono\ Medium\ 11

" comments
highlight comment gui=italic

" make transparent bg
hi! Normal ctermbg=none guibg=none 
hi! NonText ctermbg=none guibg=none guifg=none ctermfg=none
hi airline_tabfill ctermbg=none guibg=none

" hightlighted yank
let g:highlightedyank_highlight_duration = 150

" indentline
let g:indentLine_char = '│'
let g:indentLine_color_gui = '#3b4048'

" nerdtree
let NERDTreeMinimalUI=1

" netrw
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_hide = 1
let g:netrw_liststyle = 4
let g:netrw_list_hide = '^\.\.\=/\=$,.git,__pycache__,venv,node_modules,*\.o,*\.pyc,.*\.swp'
let g:netrw_winsize = 24

" airline
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '%l/%L'
