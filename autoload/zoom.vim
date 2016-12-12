let s:zoomed = 0
let s:zoom_session_file = tempname()
autocmd VimLeavePre * call delete(s:zoom_session_file)

function! zoom#toggle()
  if s:zoomed
    exec 'silent! source' s:zoom_session_file
    let s:zoomed = 0
  else
    let oldsessionoptions = &sessionoptions
    let oldsession = v:this_session
    set sessionoptions-=tabpages
    exec 'mksession!' s:zoom_session_file
    wincmd o
    let s:zoomed = 1
    let v:this_session = oldsession
    let &sessionoptions = oldsessionoptions
  endif
endfunction
