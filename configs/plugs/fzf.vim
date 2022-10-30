" Gitに追跡されているファイル
nnoremap <C-p><C-p> :GFiles<CR>
" 全てのファイル
nnoremap <C-p>p :Files<CR>
" git log
nnoremap <C-p>c :Commits<CR>
" 最近開いたファイル
nnoremap <C-p>b :Buffers<CR>

let g:fzf_buffers_jump = 1
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-s': 'vsplit' }
