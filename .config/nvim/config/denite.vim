" Denite plugins settings

" Denite interface
call denite#custom#option('_', 'prompt', '⇒')
call denite#custom#option('_', {
    \ 'prompt': '⇒',
    \ 'empty': v:false,
    \ 'winheight': 16,
    \ 'source_names': 'short',
    \ 'vertical_preview': v:true,
\ })

" Denite sources
if executable('ag')
    call denite#custom#var('file/rec', 'command',
        \ ['ag', '--nocolor', '--nogroup', '-g', ''])

    call denite#custom#var('grep', 'command', ['ag'])
    call denite#custom#var('grep', 'default_opts', ['--vimgrep'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
endif
if executable('git')
    call denite#custom#alias('source', 'file/rec/git', 'file/rec')
    call denite#custom#var('file/rec/git', 'command',
        \ ['git', 'ls-files', '-co', '--exclude-standard'])
endif

" Denite key mappings
let s:insert_mode_mappings = [
    \ ['<C-j>', '<denite:move_to_next_line>', 'noremap'],
    \ ['<C-k>', '<denite:move_to_previous_line>', 'noremap'],
\ ]
for m in s:insert_mode_mappings
    call denite#custom#map('insert', m[0], m[1], m[2])
endfor

" Key mappings to trigger denite
nnoremap <silent> <leader>bt :Denite gtags_file<cr>
nnoremap <silent> <leader>fb :Denite buffer<cr>
nnoremap <silent> <leader>ff :Denite
    \ `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'`<cr>
nnoremap <silent> <leader>fg :DeniteCursorWord grep<cr>
nnoremap <silent> <leader>fr :DeniteCursorWord
    \ `expand('<cword>') != '' ? 'gtags_ref' : 'gtags_grep'`<cr>
nnoremap <silent> <leader>ft :DeniteCursorWord
    \ `expand('<cword>') != '' ? 'gtags_def' : 'gtags_grep'`<cr>
