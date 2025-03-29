local vim = vim
local Plug = vim.fn['plug#']
vim.call('plug#begin')

Plug('Julian/lean.nvim')
Plug('neovim/nvim-lspconfig')
Plug('williamboman/mason.nvim') -- For managing LSPs
Plug('williamboman/mason-lspconfig.nvim') -- Mason interface
Plug('nvim-lua/plenary.nvim')
Plug('jose-elias-alvarez/null-ls.nvim')
Plug('hrsh7th/nvim-cmp')        -- For LSP completion
Plug('hrsh7th/vim-vsnip')       -- For snippets
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('andrewradev/switch.vim')  -- For Lean switch support
Plug('tomtom/tcomment_vim')     -- For commenting motions
Plug('nvim-telescope/telescope.nvim') -- For Loogle search
Plug('nvim-tree/nvim-web-devicons') -- optional
Plug('nvim-tree/nvim-tree.lua')
Plug('windwp/nvim-autopairs')
Plug('nvim-treesitter/nvim-treesitter')


vim.call('plug#end')

vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)')

vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]]
vim.cmd[[hi Pmenu guifg=#dadada guibg=NONE]]

vim.opt.number = true
vim.opt.mouse = 'a'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.opt.shell = "fish"

vim.g.have_nerd_font = true

vim.opt.updatetime = 250

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

