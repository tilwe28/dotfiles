local config = function()
    local nvim_tree_status_ok, nvim_tree = pcall(require, 'nvim-tree')
    if not nvim_tree_status_ok then
        return
    end

    nvim_tree.setup({
        view = {
            side = 'right',
            width = {},
        },
        renderer = {
            highlight_git = true,
            indent_markers = { enable = true, },
            icons = {
                web_devicons = {
                    folder = { enable = true, },
                },
                glyphs = {
                    folder = {
                        arrow_closed = '',
                        arrow_open = '',
                    },
                    git = {
                        unstaged = '~',
                        untracked = '?',
                    },
                },
            },
        },
        diagnostics = { enable = true, },
        modified = { enable = true, },
        filters = {
            git_ignored = false,
            custom = { '.git', '.dSYM*' },
        },
        actions = {
            open_file = {
                quit_on_open = true,
            },
        },
    })
end

return {
    'nvim-tree/nvim-tree.lua',
    lazy = false,
    version = '*',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = config,
}
