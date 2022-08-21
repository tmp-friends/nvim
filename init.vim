" Set Options
set number
set title
set tabstop=2
set expandtab
set shiftwidth=2
set smartindent
set nobackup
set hidden
set noswapfile

" IME Switching
" let &shell='/usr/bin/bash --login'
" autocmd InsertLeave * :call system('${zenhan} 0')
" autocmd CmdlineLeave * :call system('${zenhan} 0')

" Install Plugins
call plug#begin('~/.vim/plugged')
" Language Server Protocol
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
" Colorscheme
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
" Highlight *.tsx
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
" Highlight prisma
Plug 'pantharshit00/vim-prisma'
" Highlight Filer
Plug 'nvim-treesitter/nvim-treesitter'
"Customize Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Filer
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
" Fuzzy Finder
Plug 'ctrlpvim/ctrlp.vim'
" Simple Edit Surround
Plug 'tpope/vim-surround'
" Trim WhiteSpace
Plug 'bronson/vim-trailing-whitespace'
" Use Git
Plug 'tpope/vim-fugitive'
" Use Terminal
Plug 'kassio/neoterm'
call plug#end()

" coc.nvim
nmap <silent> <c-j> <Plug>(coc-definition)
nmap <silent> <c-w><c-h> :call CocAction('jumpDefinition', 'split')<CR>
nmap <silent> <c-w><c-v> :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> <c-w><c-t> :call CocAction('jumpDefinition', 'tabe')<CR>
nmap <silent> gh <Plug>(coc-float-hide)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1, 1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0, 1) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1, 1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0, 1)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1, 1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0, 1) : "\<C-b>"

" gruvbox
colorscheme gruvbox

" vim-airline
let g:airlie#extensions#tabline#enabled = 1
nmap <C-j> <Plug>AirlineSelectPrevTab
nmap <C-k> <Plug>AirlineSelectNextTabn

" fern
let g:fern_disable_startup_warnings = 1
let g:fern#default_hidden = 1
let g:fern#renderer = 'nerdfont'
nmap <C-e> :Fern . -reveal=% -drawer -toggle -width=30<CR>

function! s:init_fern() abort
    nmap <buffer> h <Plug>(fern-action-open:split)
endfunction

augroup fern-custom
    autocmd! *
    autocmd FileType fern call s:init_fern()
    autocmd VimEnter * ++nested Fern . -reveal=% -drawer -toggle -width=30
augroup END

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" vim-trailing-whitespace
autocmd BufWritePre * :FixWhitespace

" neoterm
let g:neoterm_autoinsert = 1
let g:neoterm_autoscroll = 1
let g:neoterm_default_mod = 'belowright'
nnoremap <C-t><C-t> :Ttoggle<CR>
nnoremap <C-t>t :OpenNTerm t<CR>
nnoremap <C-t>h :OpenNTerm h<CR>
nnoremap <C-t>s :OpenNTerm s<CR>
tnoremap <C-t><C-t> <C-\><C-n>:Ttoggle<CR>
tnoremap <Esc> <C-\><C-n>
command! -nargs=1 OpenNTerm call s:open_nterm(<f-args>)

function! s:open_nterm(open_type)
  let l:tmp = g:neoterm_default_mod
  echo a:open_type

  if a:open_type == 't'
    let g:neoterm_default_mod = 'tab'
  elseif a:open_type == 'h'
    let g:neoterm_default_mod = 'aboveleft'
  elseif a:open_type == 's'
    let g:neoterm_default_mod = 'vertical'
  endif
  Tnew
  let g:neoterm_default_mod = l:tmp
endfunction
