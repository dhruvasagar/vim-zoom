function! s:is_zoomed()
  return get(t:, 'zoomed', 0)
endfunction

function! s:is_only_window()
  return len(tabpagebuflist()) == 1
endfunction

function! s:set_zoomed(...)
  let t:zoomed = a:0 ? a:1 : 0
endfunction

function! s:clean_session_file()
  if exists('t:zoom_session_file')
    call delete(t:zoom_session_file)
  endif
endfunction

function! s:zoom_session_file()
  if !exists('t:zoom_session_file')
    let t:zoom_session_file = tempname().'_'.tabpagenr()
    autocmd TabClosed * call s:clean_session_file()
  endif
  return t:zoom_session_file
endfunction

function! zoom#toggle()
  if s:is_zoomed()
    let l:current_buffer = bufnr('')
    exec 'silent! source' s:zoom_session_file()
    call setqflist(s:qflist)
    silent! exe 'b'.l:current_buffer
    call s:set_zoomed()
  else
    " skip if only window
    if s:is_only_window() | return | endif

    let oldsessionoptions = &sessionoptions
    let oldsession = v:this_session
    set sessionoptions-=tabpages
    let s:qflist = getqflist()
    exec 'mksession!' s:zoom_session_file()
    wincmd o
    call s:set_zoomed(1)
    let v:this_session = oldsession
    let &sessionoptions = oldsessionoptions
  endif
endfunction

function! zoom#statusline()
  if s:is_zoomed()
    return get(g:, 'vim_zoom_statusline', 'zoomed')
  endif
  return ''
endfunction
