let g:neoterm_autoscroll = 1
let g:neoterm_default_mod = 'tab'

nnoremap <C-t><C-t> :Ttoggle<CR>
nnoremap <C-t>h :OpenNTerm h<CR>
nnoremap <C-t>s :OpenNTerm s<CR>
tnoremap <C-t><C-t> <C-\><C-n>:Ttoggle<CR>
tnoremap <Esc> <C-\><C-n>
command! -nargs=1 OpenNTerm call s:open_nterm(<f-args>)

function! s:open_nterm(open_type)
  let l:tmp = g:neoterm_default_mod
  echo a:open_type

  if a:open_type == 'h'
    let g:neoterm_default_mod = 'aboveleft'
  elseif a:open_type == 's'
    let g:neoterm_default_mod = 'vertical'
  endif
  Tnew
  let g:neoterm_default_mod = l:tmp
endfunction
