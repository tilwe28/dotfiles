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
            lualine_b = { 'branch' },
            lualine_c = {
                {
                    'buffers',
                    filetype_name = {
                        TelescopePrompt = 'Telescope',
                        NvimTree = 'Explorer',
                        mason = 'Mason',
                        lazy = 'Lazy',
                    },
                    buffers_color = {
                        -- active = 'TabLineSel',
                        -- inactive = 'TabLine',
                    },
                    symbols = {
                        alternate_file = '',
                    },
                },
            },
            lualine_x = { 'searchcount', 'selectioncount', 'filetype' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' },
        },
    },
}
