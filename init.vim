set number
set title
set tabstop=2
set expandtab
set shiftwidth=2
set smartindent

call plug#begin('~/.vim/plugged')
" Language Server Protocol
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}

" Use Git
Plug 'tpope/vim-fugitive'

" Colorscheme
Plug 'morhetz/gruvbox'
" Highlight
Plug 'nvim-treesitter/nvim-treesitter'

"Customize Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Show dirctory tree
Plug 'preservim/nerdtree'

" Simple Edit Surround
Plug 'tpope/vim-surround'

" Trim WhiteSpace
Plug 'bronson/vim-trailing-whitespace'
call plug#end()

let g:airlie#extensions#tabline#enabled = 1
nmap <C-j> <Plug>AirlineSelectPrevTab
nmap <C-k> <Plug>AirlineSelectNextTabn

nnoremap <silent><C-e> :NERDTreeToggle<CR>e

autocmd BufWritePre * :FixWhitespace

colorscheme gruvbox
