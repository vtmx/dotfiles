" ------------------------------------------------------------------------------
" plugins 
" ------------------------------------------------------------------------------

call plug#begin('~/.config/nvim/plugged')
Plug 'jdhao/better-escape.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'joshdick/onedark.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-slash'
Plug 'lepture/vim-jinja'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'preservim/tagbar'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'alvan/vim-closetag'
call plug#end()

" ------------------------------------------------------------------------------
" config 
" ------------------------------------------------------------------------------

" theme
syntax on
colo onedark
set bg=dark
set termguicolors
set guifont=IBMPlexMono\ Medium\ 11
let g:airline_theme='onedark'
let g:indentLine_char = '│'
let g:indentLine_color_gui = '#3b4048'

" make transparent bg
hi! Normal ctermbg=NONE guibg=NONE 
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

" enable filetype
filetype indent on
filetype plugin on

" sets
set autoindent smartindent autoread
set clipboard=unnamedplus
set cmdheight=1 showcmd
set cursorline
set enc=utf-8
set exrc
set hidden history=1000
set hlsearch incsearch ignorecase smartcase
set nobackup noswapfile
set noerrorbells visualbell
set mouse=a
set nowrap textwidth=0 wrapmargin=0
set number relativenumber
set tabstop=2 softtabstop=2 shiftwidth=2
set splitbelow splitright
set wildmenu wildmode=longest,list,full

" ------------------------------------------------------------------------------
" mappings 
" ------------------------------------------------------------------------------

" leaderkey \ 
let mapleader="\<space>"

" scape 
inoremap kj <esc>

" enter
nnoremap <cr> o<esc>
nnoremap <m-cr> O<esc>

" jumplines
nmap <space>j 10j<space>
nmap <space>k 10k<space>
nmap <space><space> <nop>

" remove highlight search
nnoremap <silent> <f3> :let @/ = ""<cr>

" reload
noremap <f5> :w \| :source ~/.config/nvim/init.vim<cr>

" select all
nmap <leader>a G<s-v>gg

" copy all
nmap <leader>y G<s-v>gg y

" save
nnoremap <c-s> :w!<cr>
inoremap <c-s> <esc>:w!<cr>
vnoremap <c-s> <esc>:w!<cr>

" qq to record Q to replay last record
nnoremap Q @q

" split
nnoremap ss :sp<cr>
nnoremap vv :vsp<cr>
" replace ^$
nnoremap H ^
nnoremap L $

" navigation panels
nnoremap <silent> <c-h> <c-w>h
nnoremap <silent> <c-j> <c-w>j
nnoremap <silent> <c-k> <c-w>k
nnoremap <silent> <c-l> <c-w>l

" resizes
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <silent> <up> :resize -2<cr>
nnoremap <silent> <down> :resize +2<cr>
nnoremap <silent> <left> :vertical resize -2<cr>
nnoremap <silent> <right> :vertical resize +2<cr>

" move line
nnoremap <silent> <a-k> :m-2<cr>
nnoremap <silent> <a-j> :m+<cr> 
vnoremap <silent> <a-j> :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <silent> <a-k> :m'<-2<cr>`>my`<mzgv`yo`z

" delete insert
" inoremap <c-d> <esc>ddi

" clone line
nnoremap <silent> <s-k> :t-<cr>
nnoremap <silent> <s-j> :t.<cr>
vnoremap <silent> <s-k> :copy -'><cr>
vnoremap <silent> <s-j> :copy '><cr>

" auto completion
inoremap <expr> <c-j> pumvisible() ? "\<c-n>" : "\<c-j>"
inoremap <expr> <c-k> pumvisible() ? "\<c-p>" : "\<c-k>"

" indent
nnoremap > >>
nnoremap < <<
vnoremap > >gv
vnoremap < <gv

" buffer navigation
nnoremap <silent> <a-t> :new<cr>
nnoremap <silent> <a-l> :bn<cr>
nnoremap <silent> <a-h> :bp<cr>
nnoremap <silent> <a-w> :bp \|bd #<cr>

" quit
noremap <a-q> :q!<cr>

" tab navigation
nnoremap <silent> <c-s-tab> gT
nnoremap <silent> <s-tab> gt

" ------------------------------------------------------------------------------
" plugins
" ------------------------------------------------------------------------------

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline_section_c = ''
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '%l/%L'

" better scape
let g:better_escape_interval = 200
let g:better_escape_shortcut = ['jj', 'kj', 'JJ', 'KJ']

" closetag
let g:closetag_filenames = '*.html,*.css,*.scss,*.js,*.json,*.ts,*.vue'

" coc
" coc plugins
":CocInstall coc-eslint
":CocInstall coc-emmet
":CocInstall coc-pairs
":CocInstall coc-snippets
":CocInstall coc-prettier
":CocInstall coc-vetur
"CocConfig

" coc auto completion
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'

inoremap <silent><expr> <tab>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<c-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<cr>" :
      \ <SID>check_back_space() ? "\<tab><esc>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap <leader>f <Plug>(coc-format-selected)
vnoremap <leader>f <Plug>(coc-format-selected)

" emmet
let g:user_emmet_expandabbr_key='<tab>'

" fzf
nnoremap <c-p> :GFiles .<cr>
" let g:fzf_layout = { 'down': '~40%' }

" goyo
nnoremap <silent> <leader><cr> :Goyo<cr>

" nerdtree
let NERDTreeMinimalUI=1
nnoremap <silent> <f2> :NERDTreeToggle<cr>
nnoremap <silent> <leader>e :NERDTreeToggle<cr>
nnoremap <silent> <c-s-e> :NERDTreeToggle<cr>

" tagbar
nmap <c-s-o> :TagbarToggle<cr>

