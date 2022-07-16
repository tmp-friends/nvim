" Set Options
set number
set title
set tabstop=2
set expandtab
set shiftwidth=2
set smartindent

" Install Plugins
call plug#begin('~/.vim/plugged')
" Language Server Protocol
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
" Colorscheme
Plug 'morhetz/gruvbox'
" Highlight *.tsx
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
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
call plug#end()

" gruvbox
colorscheme gruvbox

" vim-airline
let g:airlie#extensions#tabline#enabled = 1
nmap <C-j> <Plug>AirlineSelectPrevTab
nmap <C-k> <Plug>AirlineSelectNextTabn

" fern
let g:fern_disable_startup_warnings = 1
nmap <C-e> :Fern . -reveal=% -drawer -toggle -width=30<CR>
let g:fern#renderer = 'nerdfont'

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" vim-trailing-whitespace
autocmd BufWritePre * :FixWhitespace

