" Install Plugins
call plug#begin('~/.config/nvim/plugged')
  " Language Server Protocol
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'yaegassy/coc-intelephense', {'do': 'yarn install --frozen-lockfile'}
  " Colorscheme
  Plug 'EdenEast/nightfox.nvim'
  "Customize Status Bar
  Plug 'nvim-lualine/lualine.nvim'
  " Highlight Filer
  Plug 'nvim-treesitter/nvim-treesitter'
  " Highlight *.tsx
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'maxmellon/vim-jsx-pretty'
  " Highlight prisma
  Plug 'pantharshit00/vim-prisma'
  " Filer
  Plug 'lambdalisue/fern.vim'
  Plug 'lambdalisue/nerdfont.vim'
  Plug 'lambdalisue/fern-renderer-nerdfont.vim'
  " Fuzzy Finder
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " Cusor Movement
  Plug 'easymotion/vim-easymotion'
  " Simple Edit Surround
  Plug 'tpope/vim-surround'
  " Trim WhiteSpace
  Plug 'bronson/vim-trailing-whitespace'
  " Prepare Template For Easy Coding
  Plug 'mattn/vim-sonictemplate'
  " Use Git
  Plug 'tpope/vim-fugitive'
  " Use Terminal
  Plug 'kassio/neoterm'
call plug#end()
