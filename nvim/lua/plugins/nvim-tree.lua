-- Filetree
local config = function()
    local nvim_tree_status_ok, nvim_tree = pcall(require, 'nvim-tree')
    if not nvim_tree_status_ok then
        return
    end

    nvim_tree.setup({
        -- TODO: customize visuals
        renderer = {
            highlight_git = true,
            indent_markers = { enable = true, },
        },
        modified = {
            enable = true,
        },
        filters = {
            git_ignored = false,
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
