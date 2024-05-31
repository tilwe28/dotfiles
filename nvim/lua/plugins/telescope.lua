local config = function()
    local telescope_status_ok, telescope = pcall(require, 'telescope')
    if not telescope_status_ok then
        return
    end
    telescope.setup({
        defaults = {
            mappings = {
                i = {
                    ['<C-u>'] = false,
                    ['<C-d>'] = false,
                },
            },
        },
    })
end

return {
    'nvim-telescope/telescope.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = config,
}
