" ------------------------------------------------------------------------------
" Mappings 
" ------------------------------------------------------------------------------

" leader
let mapleader="\<space>"

" reload
nnoremap <silent> <leader>r :w \| :so $MYVIMRC<cr> :echo 'Reload'<cr>

" edit
nnoremap <silent> <leader>vc :e $MYVIMRC<cr>
nnoremap <silent> <leader>, :e $HOME/.config/nvim/settings.vim<cr>
nnoremap <silent> <leader>. :e $HOME/.config/nvim/keybindings.vim<cr>
nnoremap <silent> <leader>x :e $HOME/.config/nvim/plugins.vim<cr>

" scape 
inoremap kj <esc>
vnoremap <leader>kj <esc>

" better scape
let g:better_escape_interval = 200
let g:better_escape_shortcut = 'kj'

" ignore wordwrap jumpline
nnoremap <silent> k gk
nnoremap <silent> j gj

" enter normal mode
nnoremap <cr> o<esc>
nnoremap <leader>O O<esc>

" join lines
nnoremap <leader>j J

" delete dot copy
nnoremap x "_x
nnoremap <del> "_x

" keep cursor end select when visual copy
vnoremap y ygv<esc>

" enter in normal mode
nnoremap <c-cr> o<esc>k
nnoremap <m-cr> O<esc>

" remove highlight search
nnoremap <silent> <f3> :let @/ = ""<cr> :echo ''<cr>
nnoremap <silent> <esc> :let @/ = ""<cr> :echo ''<cr>

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

" jump 5 lines
nnoremap J 5j
nnoremap K 5k
vnoremap J 5j
vnoremap K 5k

" copy like C and D
nnoremap Y y$

" replace ^$
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" navigation panels
nnoremap <silent> <c-h> <c-w>h
nnoremap <silent> <c-j> <c-w>j
nnoremap <silent> <c-k> <c-w>k
nnoremap <silent> <c-l> <c-w>l

" move panels
nnoremap <silent> <c-w>h <c-w>H
nnoremap <silent> <c-w>j <c-w>J
nnoremap <silent> <c-w>k <c-w>K
nnoremap <silent> <c-w>l <c-w>L

" resizes
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <silent> <up> :resize -2<cr>
nnoremap <silent> <down> :resize +2<cr>
nnoremap <silent> <left> :vertical resize -2<cr>
nnoremap <silent> <right> :vertical resize +2<cr>

" move line
nnoremap <silent> <a-j> :m+<cr> 
nnoremap <silent> <a-k> :m-2<cr>
vnoremap <silent> <a-j> :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <silent> <a-k> :m'<-2<cr>`>my`<mzgv`yo`z

" clone line
" nnoremap <silent> <s-j> :t.<cr>
" nnoremap <silent> <s-k> :t-<cr>
" vnoremap <silent> <s-j> :copy '><cr>
" vnoremap <silent> <s-k> :copy -'><cr>

" auto completion
inoremap <expr> <c-j> pumvisible() ? "\<c-n>" : "\<c-j>"
inoremap <expr> <c-k> pumvisible() ? "\<c-p>" : "\<c-k>"

" commentary
nnoremap <leader>; :Commentary<cr>
vnoremap <leader>; :Commentary<cr>

" indent
nnoremap > >>
nnoremap < <<
vnoremap > >gv
vnoremap < <gv

" insert mode move
inoremap <c-k> <up>
inoremap <c-j> <down>
inoremap <c-l> <right>
inoremap <c-h> <left>
inoremap <c-a> <home>
inoremap <c-e> <end>

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
nnoremap fzf :Files .<cr>
nnoremap fzg :GFiles .<cr>

" goyo
nnoremap <silent> <leader><cr> :Goyo<cr>
function! s:goyo_leave()
  hi Normal guibg=NONE ctermbg=NONE
endfunction
autocmd! User GoyoLeave nested call <SID>goyo_leave()


" nerdtree
nnoremap <silent> <leader>e :NERDTreeToggle<cr>
nnoremap <silent> <c-e> :NERDTreeToggle<cr>

" tagbar
nmap <silent> <leader>o :TagbarToggle<cr>

" telescope
" ~/.config/nvim/plugged/telescope.nvim/lua/telescope/mappings.lua
nnoremap <c-p> <cmd>Telescope git_files<cr>
nnoremap <c-P> <cmd>Telescope find_files<cr>

