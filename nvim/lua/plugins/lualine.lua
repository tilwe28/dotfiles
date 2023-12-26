-- Status line
return {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    opts = {
        options = {
            icons_enabled = true,
            theme = 'onedark',
            component_separators = '|',
            section_separators = '',
            globalstatus = true,
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'filename' },
            lualine_c = { 'branch', 'searchcount', 'selectioncount' },
            lualine_x = { 'encoding', 'fileformat', 'filetype' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' },
        },
    },
}
