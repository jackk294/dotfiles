call plug#begin('~/.local/share/nvim/bundles')
    " colorscheme
    Plug 'morhetz/gruvbox'
    " status line
    Plug 'nvim-lualine/lualine.nvim'

    Plug 'neovim/nvim-lspconfig'
    " Auto completion
    Plug 'hrsh7th/nvim-cmp'
    " Telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    " Treesitter
    Plug 'nvim-treesitter/nvim-treesitter'

    Plug 'lewis6991/gitsigns.nvim'
    Plug 'easymotion/vim-easymotion'
call plug#end()

set termguicolors
colorscheme gruvbox

set hlsearch
set tabstop=4
set shiftwidth=4
set expandtab
set list    " Set tab and trailing blanks visible
set listchars=tab:>-,trail:-
set backspace=indent,eol,start
set number

let mapleader = ','

set diffopt+=iwhiteeol

source $HOME/.config/nvim/config/lualine.vim
source $HOME/.config/nvim/config/cmp.vim
source $HOME/.config/nvim/config/lsp.vim
source $HOME/.config/nvim/config/telescope.vim
source $HOME/.config/nvim/config/gitsigns.vim
