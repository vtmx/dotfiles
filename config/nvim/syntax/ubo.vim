if exists('b:current_syntax')
  finish
endif

" Comments
syntax match uboComment '^!.*$'
highlight default link uboComment Comment

" Domain
syntax match uboDomain '^[a-zA-Z0-9.-]\+'
highlight default link uboDomain Identifier

" Separator
syntax match uboSeparator '##'
syntax match uboSeparator '||'
highlight default link uboSeparator Operator

" Pseudo class
syntax match uboExtension ':[a-z-]\+(\@='
highlight default link uboExtension Function

" Special
syntax match uboOption '\$[a-z,-]\+$'
highlight default link uboOption Special

let b:current_syntax = 'ubo'
