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
set completeopt=menuone,noinsert
set clipboard+=unnamed

" IME Switching
" let &shell='/usr/bin/bash --login'
" autocmd InsertLeave * :call system('${zenhan} 0')
" autocmd CmdlineLeave * :call system('${zenhan} 0')

" Install Plugins
call plug#begin('~/.vim/plugged')
  " Language Server Protocol
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Colorscheme
  " Plug 'sainnhe/gruvbox'
  " Highlight Filer
  Plug 'nvim-treesitter/nvim-treesitter'
  " Highlight *.tsx
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'maxmellon/vim-jsx-pretty'
  " Highlight prisma
  Plug 'pantharshit00/vim-prisma'
  "Customize Status Bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Filer
  Plug 'lambdalisue/fern.vim'
  Plug 'lambdalisue/nerdfont.vim'
  Plug 'lambdalisue/fern-renderer-nerdfont.vim'
  " Fuzzy Finder
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
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
let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint8', 'coc-prettier', 'coc-python']

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

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

" default
colorscheme default

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'minimalist'

" fern
let g:fern_disable_startup_warnings = 1
let g:fern#default_hidden = 1
let g:fern#renderer = 'nerdfont'
nmap <silent> <C-e> :Fern . -reveal=% -drawer -toggle -width=30<CR>

function! s:init_fern() abort
    nmap <buffer> s <Plug>(fern-action-open:split)
endfunction

augroup fern-custom
    autocmd! *
    autocmd FileType fern call s:init_fern()
    autocmd VimEnter * ++nested Fern . -reveal=% -drawer -toggle -width=30
augroup END

" fzf
nnoremap <C-p><C-p> :GFiles<CR>
nnoremap <C-p>p :Files<CR>
nnoremap <C-p>c :Commits<CR>
nnoremap <C-p>b :Buffers<CR>
let g:fzf_buffers_jump = 1
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-s': 'vsplit' }

" vim-trailing-whitespace
autocmd BufWritePre * :FixWhitespace

" neoterm
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
