function! s:is_zoomed()
  return get(t:, 'zoomed', 0)
endfunction

function! s:set_zoomed(...)
  let t:zoomed = a:0 ? a:1 : 0
endfunction

function! s:zoom_session_file()
  if !exists('t:zoom_session_file')
    let t:zoom_session_file = tempname().'_'.tabpagenr()
    autocmd TabClosed * call delete(t:zoom_session_file)
  endif
  return t:zoom_session_file
endfunction

function! zoom#toggle()
  if s:is_zoomed()
    exec 'silent! source' s:zoom_session_file()
    call s:set_zoomed()
  else
    let oldsessionoptions = &sessionoptions
    let oldsession = v:this_session
    set sessionoptions-=tabpages
    exec 'mksession!' s:zoom_session_file()
    wincmd o
    call s:set_zoomed(1)
    let v:this_session = oldsession
    let &sessionoptions = oldsessionoptions
  endif
endfunction
