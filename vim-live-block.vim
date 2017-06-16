function! LiveBlock(type)
  redraw
  normal! gv

  let c = nr2char(getchar())
  exe "normal! "a:type.c
  redraw
  normal! gv

  "while 1
    let c = nr2char(getchar())
    if c == "\<esc>"
      break
    endif

    silent! undojoin
    exe "normal! A".c

    redraw
    normal! gvll
  "endwhile
  "exe "normal \<esc>"
endfunction

xnoremap <silent> <expr> I mode() ==# "\<C-v>" ? ":\<C-u>call LiveBlock('I')<cr>" : "I"
xnoremap <silent> <expr> A mode() ==# "\<C-v>" ? ":\<C-u>call LiveBlock('A')<cr>" : "A"

