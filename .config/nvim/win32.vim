" ------------------------------------------------------------------------------
" Win32
" ------------------------------------------------------------------------------

if has("win32")
  " themes
  set gfn=IBM_Plex_Mono_Medium:h10:cANSI
  colo one

  " remove gui
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar

  " netrw
  let g:netrw_banner = 0
  let g:netrw_liststyle = 3

  " toggle vexplore
  function! toggle_vexplore()
    if exists("t:expl_buf_num")
        let expl_win_num = bufwinnr(t:expl_buf_num)
        if expl_win_num != -1
            let cur_win_nr = winnr()
            exec expl_win_num . 'wincmd w'
            close
            exec cur_win_nr . 'wincmd w'
            unlet t:expl_buf_num
        else
            unlet t:expl_buf_num
        endif
    else
        exec '1wincmd w'
        Vexplore
        let t:expl_buf_num = bufnr("%")
    endif
  endfunction

  map <silent> <c-e> :call toggle_vexplore()<CR>
  map <silent> <leader>e :Vex<cr>

  " copy
  vnoremap <space>y "+y
  nnoremap <space>p "+p
endif
