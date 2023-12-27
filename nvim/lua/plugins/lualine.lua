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
                        -- active = "guifg='#dadde3' guibg='#21283b'",
                        -- inactive = "",
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
        extensions = {
            'lazy',
            'mason',
            'nvim-tree',
        },
    },
    config = function(_, opts)
        local lualine_status_ok, lualine = pcall(require, 'lualine')
        if not lualine_status_ok then
            return
        end
        lualine.setup(opts)
        vim.cmd([[ highlight lualine_b_normal gui=italic ]])
        vim.cmd([[ highlight lualine_c_buffers_active gui='bold,underline' guifg='#bac8e0' guibg='#21283b' ]])
        vim.cmd([[ highlight lualine_c_buffers_inactive guifg='#455574' guibg='#21283b' ]])
    end
}
