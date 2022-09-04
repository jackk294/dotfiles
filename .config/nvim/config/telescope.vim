lua << EOF
local telescope = require('telescope')
telescope.setup {
    pickers = {
        find_files = {
            find_command = {'fd', '--type', 'f', '--strip-cwd-prefix', '--no-ignore'}
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}
telescope.load_extension('fzy_native')
EOF

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({ previewer=false })<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').lsp_references()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <leader>bs <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <leader>bt <cmd>lua require('telescope.builtin').treesitter()<cr>
