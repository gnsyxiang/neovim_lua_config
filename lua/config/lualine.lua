require('lualine').setup {
    options = {
        -- theme = 'auto',
        theme = 'gruvbox',
    },
    sections = {
        lualine_c = { { 'filename', path = 1 } },
    },
}

