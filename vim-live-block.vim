function! LiveBlock(type)
  redraw
  normal! gv
  let c = nr2char(getchar())
  exe "normal! "a:type.c
  redraw
  normal! gv
  while 1
    let c = nr2char(getchar())
    if c == "\<esc>"
      break
    endif
    exe "normal! A".c

    redraw
    normal! gvl
  endwhile
  exe "normal \<esc>"
endfunction

xnoremap <expr> I mode() ==# "\<C-v>" ? ":\<C-u>call LiveBlock('I')<cr>" : "I"
xnoremap <expr> A mode() ==# "\<C-v>" ? ":\<C-u>call LiveBlock('A')<cr>" : "A"

