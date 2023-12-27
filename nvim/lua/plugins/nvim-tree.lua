-- Filetree
local config = function()
    local nvim_tree_status_ok, nvim_tree = pcall(require, 'nvim-tree')
    if not nvim_tree_status_ok then
        return
    end

    nvim_tree.setup({
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

    vim.cmd([[ highlight NvimTreeGitNew guifg='#f68058' ]])
    vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg='#455574' ]])
    vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg='#455574' ]])
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
