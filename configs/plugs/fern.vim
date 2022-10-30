let g:fern_disable_startup_warnings = 1
let g:fern#default_hidden = 1
let g:fern#renderer = 'nerdfont'
nmap <silent> <C-e> :Fern . -reveal=% -drawer -toggle -width=30<CR>

" Initial Display
augroup fern-custom
    autocmd! *
    autocmd FileType fern call s:init_fern()
    autocmd VimEnter * ++nested Fern . -reveal=% -drawer -toggle -width=30
augroup END

function! s:init_fern() abort
    nmap <buffer> s <Plug>(fern-action-open:split)
endfunction

