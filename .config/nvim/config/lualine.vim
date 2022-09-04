lua << EOF
local gruvbox = require('lualine.themes.gruvbox')

require('lualine').setup {
    options = {
        theme = gruvbox,
        icons_enabled = true,
        section_seperators = '',
        component_seprators = ''
    }
}
EOF
