if exists('g:loaded_zoom')
  finish
endif
let g:loaded_zoom = 1
if !exists('g:zoom_tmux_z')
  let g:zoom_tmux_z = v:false
endif

nnoremap <silent> <Plug>(zoom-toggle) :call zoom#toggle()<CR>

if !hasmapto('<Plug>(zoom-toggle)')
  nmap <C-W>m <Plug>(zoom-toggle)
endif
if empty($TMUX) && g:zoom_tmux_z == v:true
  nmap <C-W>z <Plug>(zoom-toggle)
endif
