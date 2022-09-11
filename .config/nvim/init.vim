lua require('plugins')

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
source $HOME/.config/nvim/config/luasnip.vim
