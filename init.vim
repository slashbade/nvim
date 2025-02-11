call plug#begin()

Plug 'Julian/lean.nvim'
Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/mason.nvim' " For managing LSPs
  Plug 'williamboman/mason-lspconfig.nvim' " Mason interface
Plug 'nvim-lua/plenary.nvim'

" Optional Dependencies:

Plug 'hrsh7th/nvim-cmp'        " For LSP completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/vim-vsnip'       " For snippets
Plug 'hrsh7th/cmp-path'
Plug 'andrewradev/switch.vim'  " For Lean switch support
Plug 'tomtom/tcomment_vim'     " For commenting motions
Plug 'nvim-telescope/telescope.nvim' " For Loogle search

call plug#end()

hi Normal guibg=NONE ctermbg=NONE
hi Pmenu guifg=#dadada guibg=NONE
set number
let mapleader = " "
