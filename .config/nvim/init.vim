" ------------------------------------------------------------------------------
" Plugins 
" ------------------------------------------------------------------------------

call plug#begin('~/.config/nvim/plugged')
Plug 'alvan/vim-closetag'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'jdhao/better-escape.vim'
Plug 'joshdick/onedark.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-slash'
Plug 'lepture/vim-jinja'
Plug 'mattn/emmet-vim'
Plug 'machakann/vim-highlightedyank'
Plug 'terryma/vim-multiple-cursors'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'preservim/tagbar'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
call plug#end()

" ------------------------------------------------------------------------------
" Style 
" ------------------------------------------------------------------------------

" theme
syntax on
colo onedark
set bg=dark
set tgc
set guifont=IBMPlexMono\ Medium\ 11

" custom styles
highlight comment gui=italic

" plugins
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
set hls is ignorecase smartcase
set nobk noswapfile
set noeb vb
set mouse=a
set nowrap textwidth=0 wrapmargin=0
set nu rnu
set tabstop=2 softtabstop=2 shiftwidth=2 et
set splitbelow splitright
set wildmenu wildmode=longest,list,full

" ------------------------------------------------------------------------------
" Mappings 
" ------------------------------------------------------------------------------

" leader
let mapleader="\<space>"

" reload
nnoremap <silent> <leader>r :w \| :so $MYVIMRC<cr> :echo 'Reload'<cr>

" edit
nnoremap <silent> <leader>ve :e $MYVIMRC<cr>

" scape 
inoremap kj <esc>
vnoremap <leader>kj <esc>

" ignore wordwrap jumpline
nnoremap <silent> k gk
nnoremap <silent> j gj

" join lines
nnoremap <leader>j J

" delete dot copy
nnoremap x "_x
nnoremap <del> "_x

" keep cursor end select
vnoremap y ygv<esc>

" enter in normal mode
nnoremap <cr> o<esc>k
nnoremap <m-cr> O<esc>

" remove highlight search
nnoremap <silent> <esc> :let @/ = ""<cr> :echo ''<cr>
nnoremap <silent> <leader><leader> :let @/ = ""<cr> :echo ''<cr>

" select all
nmap <leader>a G<s-v>gg

" copy all
nmap <leader>y G<s-v>gg y

" format
nnoremap <leader>f :retab<cr>

" save
nnoremap <c-s> :w!<cr>
inoremap <c-s> <esc>:w!<cr>

" qq to record in q, Q to play q
nnoremap Q @q

" mm to mark in m, M to jump m
nnoremap M `m

" split
nnoremap ss :sp<cr>
nnoremap vv :vsp<cr>

" copy like C and D
nnoremap Y y$

" replace ^$
nnoremap H ^
nnoremap L $
nnoremap cH c^
nnoremap cL c$
nnoremap dH d^
nnoremap dL d$
nnoremap yH y^
nnoremap yL y$
vnoremap H ^
vnoremap L $

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
nnoremap <silent> <leader>n :ene<cr>
nnoremap <silent> <leader>l :bn<cr>
nnoremap <silent> <leader>h :bp<cr>
nnoremap <silent> <leader>w :bp \|bd #<cr>
nnoremap <silent> <a-n> :ene<cr>
nnoremap <silent> <a-l> :bn<cr>
nnoremap <silent> <a-h> :bp<cr>
nnoremap <silent> <a-w> :bp \|bd #<cr>

" quit
noremap <silent> <a-q> :q!<cr>
noremap <silent> <leader>q :q!<cr>

" ------------------------------------------------------------------------------
" Plugins
" ------------------------------------------------------------------------------

" plug
nnoremap <leader>pi :PlugInstall<cr>
nnoremap <leader>pc :PlugClean<cr>
nnoremap <leader>ps :PlugStatus<cr>
nnoremap <leader>pu :PlugUpdate<cr>
nnoremap <leader>pg :PlugUpgrade<cr>

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
let g:better_escape_shortcut = 'kj'

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
      \ <sid>check_back_space() ? "\<tab><esc>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <leader>F <Plug>(coc-format-selected)
inoremap <silent><expr> <c-space> coc#refresh()

" easymotion
map <leader><leader>f <plug>(easymotion-bd-f)

" emmet
let g:user_emmet_expandabbr_key='<tab>'

" fzf
nnoremap <c-p> :GFiles .<cr>
"nnoremap <c-p> :Files .<cr>
"let g:fzf_layout = { 'down': '~40%' }

" goyo
nnoremap <silent> <leader><cr> :Goyo<cr>
function! s:goyo_leave()
  hi Normal guibg=NONE ctermbg=NONE
endfunction
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" hightlightedyank
let g:highlightedyank_highlight_duration = 150

" nerdtree
let NERDTreeMinimalUI=1
nnoremap <silent> <f2> :NERDTreeToggle<cr>
nnoremap <silent> <leader>e :NERDTreeToggle<cr>
nnoremap <silent> <c-e> :NERDTreeToggle<cr>

" tagbar
nmap <silent> <leader>o :TagbarToggle<cr>

" telescope
" ~/.config/nvim/plugged/telescope.nvim/lua/telescope/mappings.lua
nnoremap <c-p> <cmd>Telescope git_files<cr>
nnoremap <c-P> <cmd>Telescope find_files<cr>
