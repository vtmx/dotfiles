"  _    _ _____ _______  _____   ______ _______ _______         _____ 
"   \  /    |      |    |     | |_____/ |  |  | |______ |      |     |
"    \/   __|__    |    |_____| |    \_ |  |  | |______ |_____ |_____|
"

" ------------------------------------------------------------------------------
" Config
" ------------------------------------------------------------------------------

" Enable filetype
filetype indent on
filetype plugin on
syntax on

" Sets
set autochdir
set autoindent smartindent autoread
set bg=dark
set clipboard=unnamedplus
set cmdheight=1 showcmd
set cursorline
set enc=utf-8
set expandtab tabstop=2 softtabstop=2 shiftwidth=2
set exrc
set hidden history=1000
set hlsearch ignorecase smartcase
set lazyredraw
set mouse=a
set nobackup noswapfile
set noerrorbells novisualbell
set nowrap textwidth=0 wrapmargin=0
set number relativenumber
set splitbelow splitright
set tgc
set wildmenu

" Netrw
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_hide = 1
let g:netrw_liststyle = 4
let g:netrw_list_hide = '^\.\.\=/\=$,.git,__pycache__,venv,node_modules,*\.o,*\.pyc,.*\.swp'
let g:netrw_winsize = 24

" ------------------------------------------------------------------------------
" Mappings 
" ------------------------------------------------------------------------------

" Normal Mode

" Leader
let mapleader="\<space>"

" Reload
nnoremap <silent> <leader>r :w \| :so $MYVIMRC<cr> :echo 'Reload'<cr>

" Scape 
inoremap kj <esc>

" Ignore wordwrap jumpline
nnoremap <silent> k gk
nnoremap <silent> j gj

" Leader o
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" Join lines
nnoremap <leader>j J

" Delete dot copy
nnoremap x "_x
nnoremap <del> "_x

" Remove highlight search
nnoremap ç :nohl<cr>
nnoremap <c-l> :nohl<cr>

" Select all
nmap <leader>a G<s-v>gg

" Copy all
nmap <leader>% G<s-v>gg y

" Format
nnoremap <leader>f :retab<cr>

" Save
nnoremap <c-s> :w!<cr>
inoremap <c-s> <esc>:w!<cr>

" qq to record in q, Q to play q
nnoremap Q @q

" mm to mark in m, M to jump m
nnoremap M `m

" Split
nnoremap ss :sp<cr>
nnoremap vv :vsp<cr>

" Jump 5 lines
nnoremap J 5j
nnoremap K 5k
vnoremap J 5j
vnoremap K 5k

" Copy like C and D
nnoremap Y y$

" Replace ^$
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" Move line
nnoremap <silent> <a-j> :m+<cr> 
nnoremap <silent> <a-k> :m-2<cr>
vnoremap <silent> <a-j> :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <silent> <a-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Clone line
" nnoremap <silent> <s-j> :t.<cr>
" nnoremap <silent> <s-k> :t-<cr>
" vnoremap <silent> <s-j> :copy '><cr>
" vnoremap <silent> <s-k> :copy -'><cr>

" Auto completion
inoremap <expr> <c-j> pumvisible() ? "\<c-n>" : "\<c-j>"
inoremap <expr> <c-k> pumvisible() ? "\<c-p>" : "\<c-k>"

" Indent
nnoremap > >>
nnoremap < <<
vnoremap > >gv
vnoremap < <gv

" Insert mode move
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-h> <left>
inoremap <c-l> <right>

" Buffer navigation
nnoremap <silent> <leader>n :ene<cr>

" Visual Mode

" Back normal mode
vnoremap ç <esc>

" Keep cursor end select when visual copy
vnoremap y ygv<esc>

" Toggle
map <F3> :set relativenumber!<CR>

" Toggle show number
nnoremap <leader>N :set number!<CR>

" Show tabs and trailing spaces, toggle with F4
map <F4> :set list!<CR>
" set list listchars=tab:»-,nbsp:·,eol:¶,trail:§

" Toggle spell check with F5
map <F5> :setlocal spell! spelllang=pt_br<CR>

" Remove all spaces at eol
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" ------------------------------------------------------------------------------
" Theme
" ------------------------------------------------------------------------------

hi Normal     guifg=#abb2bf guibg=#23272e
hi CursorLine guibg=#2c313c

" Comments
hi Comment guifg=#5c6370 gui=italic

" ------------------------------------------------------------------------------

" Hightlighted yank
let g:highlightedyank_highlight_duration = 150

" Indentline
let g:indentLine_char = '│'
let g:indentLine_color_gui = '#3b4048'

" Change cursor
"let &t_SI = "\e[6 q"
"let &t_EI = "\e[2 q"

"hi InsertCursor guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
"hi VisualCursor guifg=black guibg=#d7afff ctermfg=black ctermbg=yellow
"hi ReplaceCursor guifg=black guibg=#d75f5f ctermfg=black ctermbg=darkred
"hi CommandCursor guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
