-- Fuzzy Finder & Telescope
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

    telescope.load_extension('fzf')
end

return {
    'nvim-telescope/telescope.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function ()
                return vim.fn.executable('make') == 1
            end,
        },
    },
    config = config,
}
