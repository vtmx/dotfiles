" ------------------------------------------------------------------------------
" Options
" ------------------------------------------------------------------------------

set autochdir
set autoread
set bg=dark
set clipboard=unnamedplus
set cmdheight=1 showcmd
set cursorline
set enc=utf-8
set exrc
set hidden history=1000
set hlsearch ignorecase smartcase
set lazyredraw
set listchars=eol:↲,nbsp:+,space:.,tab:›-,trail:⋯
set tabstop=2 softtabstop=2 shiftwidth=2
set mouse=a
set nobackup noswapfile
set noerrorbells novisualbell
set nowrap textwidth=0 wrapmargin=0
set number relativenumber
set scrolloff=8
set splitbelow splitright
set termguicolors
set ttimeout ttimeoutlen=100 updatetime=250
set wildmenu
" wildmode=list:longest

" ------------------------------------------------------------------------------
" Autocmds
" ------------------------------------------------------------------------------

" No continue coments
autocmd FileType * setlocal formatoptions-=o

" ------------------------------------------------------------------------------
" Functions
" ------------------------------------------------------------------------------

" Apply hightlight colors
function! s:h(group, attrs)
  let l:cmd = 'highlight ' . a:group
  if has_key(a:attrs, 'fg')
    let l:cmd .= ' guifg=' . a:attrs['fg']
  endif
  if has_key(a:attrs, 'bg')
    let l:cmd .= ' guibg=' . a:attrs['bg']
  endif
  if has_key(a:attrs, 'gui')
    let l:cmd .= ' gui=' . a:attrs['gui']
  endif
  execute l:cmd
endfunction

" Clear all styles
function! ClearAllHighlights()
  for group in split(execute('highlight'), '\n')
    let group_name = matchstr(group, '^\S\+')
    if group_name != ''
      execute 'highlight ' . group_name . ' NONE'
    endif
  endfor
endfunction

" Toggle Lex
function! ToggleLex()
	if exists("t:lex_opened") && t:lex_opened
		let t:lex_opened = 0
		lclose
	else
		let t:lex_opened = 1
		Lex
	endif
endfunction

" Get current mode
function! GetCurrentMode()
	let l:mode = mode()
	return 
    \ l:mode ==# 'c'  ? 'CMD' :
    \ l:mode ==# 'n'  ? 'NOR' :
		\ l:mode ==# 'i'  ? 'INS' :
		\ l:mode ==# 'R'  ? 'REP' :
		\ l:mode ==# 'v'  ? 'VIS' :
		\ l:mode ==# 'V'  ? 'VIS' :
		\ ''
endfunction

" Toggle zen

let g:is_zen = 0

function! ToggleZen()
	if g:is_zen ==# 1
		set number
		set relativenumber
		set nowrap
		set nolinebreak
		set nobreakindent
		set laststatus=2
		let g:is_zen = 0
	else
		set nonumber
		set norelativenumber
		set wrap
		set linebreak
		set breakindent
		set laststatus=0
		let g:is_zen = 1
	endif
endfunction


" ------------------------------------------------------------------------------
" Plugins
" ------------------------------------------------------------------------------

" Cursor
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Netrw
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_hide = 1
let g:netrw_liststyle = 4
let g:netrw_list_hide = '^\.\.\=/\=$,.git,__pycache__,venv,node_modules,*\.o,*\.pyc,.*\.swp'
let g:netrw_winsize = 24

set statusline=
set statusline+=%{GetCurrentMode()}\ %F\ %M
set statusline+=%=
set statusline+=\%l,%c
set laststatus=2

" ------------------------------------------------------------------------------
" Mappings 
" ------------------------------------------------------------------------------

" Leader
let mapleader="\<space>"

" Normal

" Ignore wordwrap jumpline
nnoremap <silent> k gk
nnoremap <silent> j gj

" Remove highlight search
nnoremap ç <cmd>nohl<cr>

" Split
nnoremap ss <cmd>sp<cr>
nnoremap vv <cmd>vsp<cr>

" Delete dot copy
nnoremap x "_x
nnoremap <del> "_x

" Jump 5 lines
nnoremap J 5j
nnoremap K 5k
vnoremap J 5j
vnoremap K 5k

" mm to mark in m, M to jump m
nnoremap M `m

" qq to record in q, Q to play q
nnoremap Q @q

" Copy like C and D
nnoremap Y y$

" Replace ^$
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" Undo
nnoremap U <c-r>

" Save
nnoremap <c-s> <cmd>w!<cr>

" Remove highlight search
nnoremap <c-l> <cmd>nohlsearch<bar>diffupdate<cr><c-l>

" Move line
nnoremap <silent> <a-j> <cmd>m+<cr> 
nnoremap <silent> <a-k> <cmd>m-2<cr>
vnoremap <silent> <a-j> <cmd>m'>+<cr>`<my`>mzgv`yo`z
vnoremap <silent> <a-k> <cmd>m'<-2<cr>`>my`<mzgv`yo`z

" Clone line
" nnoremap <silent> <s-j> <cmd>t.<cr>
" nnoremap <silent> <s-k> <cmd>t-<cr>
" vnoremap <silent> <s-j> <cmd>copy '><cr>
" vnoremap <silent> <s-k> <cmd>copy -'><cr>

" Indent
nnoremap > >>
nnoremap < <<
vnoremap > >gv
vnoremap < <gv

" Buffer navigation
nnoremap <silent> <leader>n <cmd>ene<cr>

" Leader

" Select all
nmap <leader>a G<s-v>gg

" Toggle Lex
nnoremap <silent> <leader>e <cmd>call ToggleLex()<CR>

" Format
nnoremap <leader>f <cmd>retab<cr>

" Join lines
nnoremap <leader>j J

" Leader o
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" Clipboard
nnoremap <leader>p "+gp<esc><cmd>echo "Paste from clipboard"<cr>

" Reload
nnoremap <leader>r <cmd>w<cr><cmd>so $MYVIMRC<cr><cmd>nohl<cr><cmd>echo 'Reload'<cr>

" Substitute current word
nnoremap <leader>s <cmd>s/<C-r><C-w>//g<Left><Left>

" Remove all spaces at eol
nnoremap <leader>S <cmd>s/\s\+$//<cr>:let @/=''<cr>

" Open terminal
nnoremap <leader>t <cmd>below term<cr>

" Open vertical terminal
nnoremap <leader>T <cmd>vert term<cr>

" Toggle relative number
nnoremap <leader>ur <cmd>set relativenumber!<cr>

" Toggle show number
nnoremap <leader>un <cmd>set number!<cr>

" Show tabs and trailing spaces
nnoremap <leader>ul <cmd>set list!<cr>

" Toggle spell
nnoremap <leader>us <cmd>set spell! spelllang=pt_br<cr>

" Toggle wrap
nnoremap <leader>uw <cmd>set wrap!<cr>

" Toggle zen
nnoremap <leader>z <cmd>call ToggleZen()<cr>

" Copy all
nmap <leader>% G<s-v>gg y

" Insert

" Scape 
inoremap kj <esc>

" Insert mode move
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-h> <left>
inoremap <c-l> <right>
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" Save
inoremap <c-s> <esc><cmd>w!<cr>

" Visual

" Back normal mode
vnoremap ç <esc>

" Clipboard
vnoremap <leader>y "+ygv<esc><cmd>echo "Copy to clipboard"<cr>

" Keep cursor end select when visual copy
vnoremap y ygv<esc>

" ------------------------------------------------------------------------------
" Theme
" ------------------------------------------------------------------------------

syntax on
call ClearAllHighlights()

" Colors
let g:bd     = "#1e2227"
let g:bg     = "#23272e"
let g:bl     = "#2c313c" " cursorline and sel
let g:fd     = "#5c6370" " comment
let g:fg     = "#abb2bf"
let g:fl     = "#0000ff"
let g:ac     = "#3d4556" " selection and accent
let g:red    = "#e06c75"
let g:orange = "#d19a66"
let g:yellow = "#e5c07b"
let g:green  = "#98c379"
let g:cyan   = "#56b6c2"
let g:blue   = "#61afef"
let g:purple = "#c678dd"

" General
call s:h("Normal",      { "fg": g:fg, "bg": g:bg })
call s:h("CursorLine",  { "bg": g:bl })
call s:h("Comment",     { "fg": g:fd, "gui": "italic", "cterm": "italic" })
call s:h("Title",       { "fg": g:purple  })
call s:h("Twilight",    { "fg": g:fd      })

" Sintaxy
call s:h("Boolean",      { "fg": g:orange })
call s:h("Character",    { "fg": g:green  })
call s:h("Conditional",  { "fg": g:purple })
call s:h("Constant",     { "fg": g:orange })
call s:h("Define",       { "fg": g:purple })
call s:h("ErrorMsg",     { "fg": g:red    })
call s:h("Exception",    { "fg": g:purple })
call s:h("Float",        { "fg": g:orange })
call s:h("Function",     { "fg": g:blue   })
call s:h("Identifier",   { "fg": g:red    })
call s:h("Include",      { "fg": g:purple })
call s:h("Keyword",      { "fg": g:purple })
call s:h("Label",        { "fg": g:red    })
call s:h("Macro",        { "fg": g:red    })
call s:h("Number",       { "fg": g:orange })
call s:h("Operator",     { "fg": g:cyan   })
call s:h("PreCondit",    { "fg": g:purple })
call s:h("PreProc",      { "fg": g:purple })
call s:h("Repeat",       { "fg": g:purple })
call s:h("Tag",          { "fg": g:red    })
call s:h("Statement",    { "fg": g:purple })
call s:h("String",       { "fg": g:green  })
call s:h("StorageClass", { "fg": g:purple })
call s:h("Structure",    { "fg": g:purple })
call s:h("Typedef",      { "fg": g:purple })
call s:h("Type",         { "fg": g:purple })

  " Keys [] {} ()
call s:h("Delimiter",    { "fg": g:fg     })
call s:h("MatchParen",   { "fg": g:fg     })

  " Extras
call s:h("Added",          { "fg": g:green  })
call s:h("Changed",        { "fg": g:blue   })
call s:h("Debug",          { "fg": g:yellow })
call s:h("Directory",      { "fg": g:blue   })
call s:h("EndOfBuffer",    { "fg": g:bg     })
call s:h("NonText",        { "fg": g:fd     })
call s:h("Special",        { "fg": g:fg     })
call s:h("SpecialChar",    { "fg": g:yellow })
call s:h("SpecialComment", { "fg": g:fd     })
call s:h("SpecialKey",     { "fg": g:cyan   })
call s:h("TermCursor",     { "fg": g:fg     })

  " Search
call s:h("IncSearch",      { "bg": g:ac     })
call s:h("Search",         { "bg": g:ac     })
call s:h("CurSearch",      { "bg": g:fg, "fg": g:bg })
call s:h("Conceal",        { "bg": g:ac     })

" Messages
call s:h("ModeMsg",        { "fg": g:fd     })
call s:h("MoreMsg",        { "fg": g:fd     })
call s:h("Question",       { "fg": g:fg     })
call s:h("WarningMsg",     { "fg": g:yellow })

" Alerts
call s:h("Ignore",         { "fg": g:fg     })
call s:h("Error",          { "fg": g:red    })
call s:h("Todo",           { "fg": g:purple })

" Line highlight
call s:h("CursorLine",     { "bg": g:bl })

" Select text
call s:h("Visual",         { "bg": g:ac })

" Line number column
call s:h("CursorLineFold", { "fg": g:fg })
call s:h("CursorLineNr",   { "fg": g:fg })
call s:h("CursorLineSign", { "fg": g:fg })
call s:h("LineNr",         { "fg": g:ac })
call s:h("LineNrAbove",    { "fg": g:ac })
call s:h("LineNrBelow",    { "fg": g:ac })

" ColorColumn
call s:h("ColorColumn",    { "bg": g:bl })

" Pmenu
call s:h("Pmenu",          { "bg": g:bd })
call s:h("PmenuSel",       { "bg": g:bl })
call s:h("PmenuSbar",      { "bg": g:bd })
call s:h("Pmenuac",        { "bg": g:bl })
call s:h("PmenuThumb",     { "bg": g:bl })

" Popup
call s:h("NormalFloat",        { "bg": g:bg })
call s:h("FloatBorder",        { "bg": g:bg, "fg": g:fd })
call s:h("FloatShadow",        { "bg": g:bd })
call s:h("FloatShadowThrough", { "bg": g:bd })

" Tabbar
call s:h("WinbarNC",       { "fg": g:fd })
call s:h("WinSeparator",   { "fg": g:ac })

" Statusline
call s:h("StatusLine",     { "fg": g:fd   })

" Line win separator split e statusline inativa
call s:h("StatusLineNC",   { "fg": g:fd   })

