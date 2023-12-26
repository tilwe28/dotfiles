-- Git
return {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    opts = {
        signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
        },
    },

    -- NOTE: May want to add keymaps for extra git functionality

}
