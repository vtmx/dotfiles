" plugins 
call plug#begin('~/.vim/plugged')
Plug 'jdhao/better-escape.vim'
Plug 'cocopon/iceberg.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
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

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
" theme
syntax on
colo onedark
set bg=dark
set termguicolors
set guifont=Roboto\ Mono:h13
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

" scape 
imap jj <esc>
imap kj <esc>
imap JJ <esc>
imap KJ <esc>

" toggle highlight search 
map <f3> :set hlsearch!<cr>

" reload vim
map <f5> :w \| :source ~/.config/nvim/init.vim<cr>

" save and quit
map <c-s> :w<cr>
map <c-q> :q!<cr>
map <leader>z :wq!<cr>

" split
nmap ss :sp<cr>
nmap vv :vsp<cr>

" ^$ replace
nmap H ^
nmap cH c^
nmap dH d^
nmap L $
nmap cL c$
nmap dL d$

" panels navigation
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l

" resizes
nmap <up> :resize -2<cr>
nmap <down> :resize +2<cr>
nmap <left> :vertical resize +2<cr>
nmap <right> :vertical resize -2<cr>

" move line
nmap <a-k> :m-2<cr>
nmap <a-j> :m+<cr> 
vmap <a-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <a-k> :m'<-2<cr>`>my`<mzgv`yo`z

" clone line
nmap <s-k> :t-<cr>
nmap <s-j> :t.<cr>
vmap <s-k> :copy -'><cr>
vmap <s-j> :copy '><cr>

" buffer navigation
nmap <a-l> :bn<cr>
nmap <a-h> :bp<cr>
nmap <a-w> :bp \|bd #<cr>

" tab navigation
nmap <c-s-tab> gT
nmap <s-tab> gt

" plugins
let NERDTreeMinimalUI=1
let g:better_escape_interval = 200
let g:better_escape_shortcut = ['jj', 'kj', 'JJ', 'KJ']
map <f10> :Goyo<cr>
nmap <c-f> :Ag<cr>
nmap <f2> :NERDTreeToggle<cr>
nmap <c-p> :Files<cr>

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
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_section_c = ''
let g:airline_section_y = ''
let g:airline_section_z = '%3l/%L'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
