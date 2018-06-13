if &compatible
    set nocompatible
endif

set runtimepath+=$HOME/.config/nvim/bundles/repos/github.com/Shougo/dein.vim

if dein#load_state('$HOME/.config/nvim/bundles')
    call dein#begin('$HOME/.config/nvim/bundles')
    call dein#add('$HOME/.config/nvim/bundles')

    " Colorschemes
    call dein#add('altercation/vim-colors-solarized')
    call dein#add('iCyMind/NeoSolarized')

    call dein#add('Shougo/denite.nvim')
    call dein#add('ozelentok/denite-gtags', {'depends': ['denite']})
    call dein#add('Valloric/YouCompleteMe', {'on_ft': ['c', 'cpp']})
    call dein#add('airblade/vim-gitgutter')
    call dein#add('easymotion/vim-easymotion')
    call dein#add('tpope/vim-fugitive')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

" Start custom settings
set hlsearch
set tabstop=4
set shiftwidth=4
set expandtab
set list    " Set tab and tailing blanks visible
set listchars=tab:>-,trail:-
set laststatus=2    " Always show status line
set backspace=indent,eol,start
set nu
set background=dark

" Color scheme
set termguicolors
colorscheme NeoSolarized
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 0

" Custom map leader
let mapleader = ','
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Locale encoding settings
if !has('nvim')
    set encoding=utf-8
    set termencoding=utf-8
endif
set fileencodings=ucs-bom,utf-8,cp936,latin1

" Vim-airline plugin settings
let g:airline_powerline_fonts = 1
let g:airline_section_z = '%#__accent_bold#%4l%#__restore__#,%3c %{g:airline_symbols.linenr} %3p%%'
let g:airline_theme = 'papercolor'
let g:airline#extensions#tabline#enabled = 1

" Denite plugin settings
source $HOME/.config/nvim/config/denite.vim

" Easymotion plugin settings
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Bi-directional find motion
nmap s <Plug>(easymotion-s2)
omap t <Plug>(easymotion-bd-tl)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: line motions
map <leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <leader>h <Plug>(easymotion-linebackward)
" Keep cursor column when JK motion
let g:Easymotion_startofline = 0
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" YouCompleteMe plugin settings
nnoremap <leader>yg :YcmCompleter GoTo<CR>
nnoremap <leader>yt :YcmCompleter GetType<CR>
nnoremap <leader>yi :YcmCompleter GoToInclude<CR>
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_filetype_whitelist = {'c': 1, 'cpp': 1}
let g:ycm_python_binary_path = 'python3'
