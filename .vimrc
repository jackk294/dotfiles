set nocompatible
filetype off

set runtimepath+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Bundles managed by Vundle
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'easymotion/vim-easymotion'
Plugin 'ervandew/supertab'
Plugin 'honza/vim-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/Gundo'
Plugin 'vim-scripts/matchit.zip'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on

" Start custom settings
syntax enable
set hlsearch
set tabstop=4
set shiftwidth=4
set expandtab
set list    " Set tab and tailing blanks visible
set listchars=tab:>-,trail:-
set laststatus=2    " Always show status line
set backspace=indent,eol,start
set background=dark

if exists('$TMUX')
    set term=xterm-256color
endif

" colorscheme solarized settings
let g:solarized_termcolors = 256
colorscheme solarized

" Custom map leader
let mapleader = ','

" Locale encoding settings
set encoding=utf-8
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,latin1

" Vim-airline plugin settings
let g:airline_powerline_fonts = 1
let g:airline_section_z = '%#__accent_bold#%4l%#__restore__#,%3c %{g:airline_symbols.linenr} %3p%%'
let g:airline_theme = 'dark'

" Ack plugin settings
let g:ackprg = 'ag --nogroup --nocolor --column'

" Tagbar plugin settings
nnoremap <F4> :TagbarToggle<CR>

" Nerdtree plugin settings
nnoremap <F3> :NERDTreeToggle<CR>

" Gundo plugin settings
nnoremap <F5> :GundoToggle<CR>
let g:gundo_width = 30
let g:gundo_preview_bottom = 1

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

" Supertab plugin settings
let g:SuperTabDefaultCompletionType = '<C-n>'

" Ultisnips plugin settings
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-tab>'
let g:UltiSnipsListSnippets = '<leader>ul'

" YouCompleteMe plugin settings
nnoremap <leader>yd :YcmDiags<CR>
nnoremap <leader>yg :YcmCompleter GoTo<CR>
nnoremap <leader>yt :YcmCompleter GetType<CR>
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_invoke_completion = '<leader>yy'
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
