if exists('g:loaded_zoom')
  finish
endif
let g:loaded_zoom = 1

nnoremap <C-W>m :call zoom#toggle()<CR>
