if &compatible
    set nocompatible
endif

call plug#begin('$HOME/.config/nvim/bundle')

" Bundles managed by vim-plug
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'iCyMind/NeoSolarized'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'

call plug#end()

filetype plugin indent on

" Start custom settings
set hlsearch
set tabstop=4
set shiftwidth=4
set expandtab
set list    " Set tab and tailing blanks visible
set listchars=tab:>-,trail:-
set backspace=indent,eol,start
set nu
syntax enable

if exists('g:gui_oni')
    set laststatus=0
    set background=light

    " Disable airline for oni gui
    let g:loaded_airline = 1
else
    set laststatus=2
    set background=dark
endif
colorscheme NeoSolarized

" Custom map leader
let mapleader = ','

" Locale encoding settings
if !has('nvim')
    set encoding=utf-8
    set termencoding=utf-8
endif
set fileencodings=ucs-bom,utf-8,cp936,latin1

" Vim-airline plugin settings
let g:airline_powerline_fonts = 1
let g:airline_section_z = '%#__accent_bold#%4l%#__restore__#,%3c %{g:airline_symbols.linenr} %3p%%'
let g:airline_theme = 'dark'
let g:airline#extensions#tabline#enabled = 1

" Nerdtree plugin settings
nnoremap <F3> :NERDTreeToggle<CR>

" Tagbar plugin settings
nnoremap <F4> :TagbarToggle<CR>

" Gundo plugin settings
nnoremap <F5> :GundoToggle<CR>
let g:gundo_width = 30
let g:gundo_preview_bottom = 1

" FuzzyFinder plugin settings
let g:fzf_command_prefix = 'Fzf'
let g:fzf_history_dir = '~/.local/share/fzf-history'
" [Files] Extra options for fzf
"         e.g. File preview using coderay (http://coderay.rubychan.de/)
let g:fzf_files_options =
    \ '--preview "(cat {}) 2> /dev/null | head -'.&lines.'"'
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 0
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
"" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
" Replace the default dictionary completion with fzf-based fuzzy completion
inoremap <expr> <c-x><c-k> fzf#complete('cat /usr/share/dict/words')
" Custom mappings
nnoremap <leader>ff :FzfFiles<CR>
nnoremap <leader>fb :FzfBuffers<CR>
nnoremap <leader>fl :FzfLines<CR>
nnoremap <leader>fs :FzfSnippets<CR>
nnoremap <leader>fm :FzfCommits<CR>
nnoremap <leader>fa :FzfAg <C-R><C-W><CR>
nnoremap <leader>ft :FzfTags<CR>

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

" Ultisnips plugin settings
let g:UltiSnipsEnableSnipMate = 0
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" YouCompleteMe plugin settings
nnoremap <leader>yd :YcmDiags<CR>
nnoremap <leader>yg :YcmCompleter GoTo<CR>
nnoremap <leader>yt :YcmCompleter GetType<CR>
nnoremap <leader>yi :YcmCompleter GoToInclude<CR>
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" Make YCM compatible with UltiSnips
let g:SuperTabDefaultCompletionType = '<C-n>'
