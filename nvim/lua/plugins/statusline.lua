return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,

    opts = {
        options = {
            theme = 'onedark',
            component_separators = '|',
            section_separators = '',
            globalstatus = true,
        },
        sections = {
            lualine_y = { 'searchcount', 'selectioncount', 'progress' },
        },
        extensions = { 'lazy', 'mason', 'nvim-tree' },
    },

    config = function(_, opts)
        local lualine_status_ok, lualine = pcall(require, 'lualine')
        if not lualine_status_ok then
            return
        end
        lualine.setup(opts)
    end
}
