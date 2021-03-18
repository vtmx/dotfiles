" ------------------------------------------------------------------------------
" plugins 
" ------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'jdhao/better-escape.vim'
Plug 'cocopon/iceberg.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-slash'
Plug 'mattn/emmet-vim'
Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
call plug#end()

" ------------------------------------------------------------------------------
" config 
" ------------------------------------------------------------------------------

" theme
syntax on
colo onedark
set bg=dark
set termguicolors
set guifont=Fira\ Code:h12
let g:airline_theme='onedark'
let g:indentLine_char = '│'
let g:indentLine_color_gui = '#3b4048'

" enable filetype
filetype indent on
filetype plugin on

" sets
set autoindent smartindent
set autoread
set clipboard=unnamedplus
set cmdheight=1 showcmd
set cursorline
set enc=utf-8
set hidden history=1000
set hlsearch incsearch ignorecase smartcase
set nobackup noswapfile
set noerrorbells visualbell
set mouse=a
set number relativenumber
set tabstop=2 softtabstop=2 
set nowrap textwidth=0 wrapmargin=0
set wildmenu

" ------------------------------------------------------------------------------
" mappings 
" ------------------------------------------------------------------------------

" leaderkey \ 
let mapleader="\<space>"

" scape 
imap jj <esc>
imap kj <esc>
imap JJ <esc>
imap KJ <esc>

" enter
nnoremap <cr> o<esc>
nnoremap <m-cr> O<esc>

" jumplines
nnoremap <space>j 10j<space>
nnoremap <space>k 10k<space>

" toggle highlight search 
map <f3> :set hlsearch!<cr>

" reload
map <f5> <nop>
map <f5> :w \| :source ~/.config/nvim/init.vim<cr>

" select all
"map <c-a> <esc>ggVG<cr>

" save
map <c-s> :w<cr>
"imap <c-s> <esc>:w<cr>

" quit
map <c-q> :q!<cr>

" qq to record Q to replay
nnoremap Q @q

" split
nnoremap ss :sp<cr>
nnoremap vv :vsp<cr>

" ^$ replace
nnoremap H ^
nnoremap L $

" navigation panels
nnoremap <silent> <c-h> <c-w>h
nnoremap <silent> <c-j> <c-w>j
nnoremap <silent> <c-k> <c-w>k
nnoremap <silent> <c-l> <c-w>l

" resizes
"nnoremap <up> :resize -2<cr>
"nnoremap <down> :resize +2<cr>
nnoremap <silent> <left> :vertical resize -2<cr>
nnoremap <silent> <right> :vertical resize +2<cr>

" move line
nnoremap <a-k> :m-2<cr>
nnoremap <a-j> :m+<cr> 
vmap <a-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <a-k> :m'<-2<cr>`>my`<mzgv`yo`z

" clone line
nnoremap <s-k> :t-<cr>
nnoremap <s-j> :t.<cr>
vmap <s-k> :copy -'><cr>
vmap <s-j> :copy '><cr>

" auto completion
inoremap <expr> <c-j> pumvisible() ? "\<c-n>" : "\<c-j>"
inoremap <expr> <c-k> pumvisible() ? "\<c-p>" : "\<c-k>"

" buffer navigation
nnoremap <a-l> :bn<cr>
nnoremap <a-h> :bp<cr>
nnoremap <a-w> :bp \|bd #<cr>

" tab navigation
nnoremap <c-s-tab> gT
nnoremap <s-tab> gt

" ------------------------------------------------------------------------------
" plugins
" ------------------------------------------------------------------------------

" airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#whitespace#enabled = 0
let g:airline_section_c = ''
let g:airline_section_y = ''
let g:airline_section_z = '%l/%L'

" better scape
let g:better_escape_interval = 200
let g:better_escape_shortcut = ['jj', 'kj', 'JJ', 'KJ']

" coc
":CocInstall coc-pairs
":CocInstall coc-prettier
":CocInstall coc-eslint
":CocInstall coc-vetur
":CocInstall coc-snippets
"CocConfig

" coc auto completion
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap <leader>f  <Plug>(coc-format-selected)
vmap <leader>f  <Plug>(coc-format-selected)

" emmet
let g:user_emmet_expandabbr_key='<tab>'

" fzf
nnoremap <c-p> :Files<cr>
" let g:fzf_layout = { 'down': '~40%' }

" goyo
map <f10> :Goyo<cr>

" nerdtree
let NERDTreeMinimalUI=1
nnoremap <f2> :NERDTreeToggle<cr>
nnoremap <c-n> :NERDTreeToggle<cr>
nnoremap <c-s-e> :NERDTreeToggle<cr>
