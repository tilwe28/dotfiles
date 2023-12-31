-- Which-Key
local config = function()
    local which_key_status_ok, which_key = pcall(require, 'which-key')
    if not which_key_status_ok then
        return
    end
    which_key.register {
        ['<Leader>c'] = { name = 'Code', _ = 'which_key_ignore' },
        ['<Leader>g'] = { name = 'Git', _ = 'which_key_ignore' },
        ['<Leader>r'] = { name = 'Rename', _ = 'which_key_ignore' },
        ['<Leader>s'] = { name = 'Search', _ = 'which_key_ignore' },
        ['<Leader>W'] = { name = 'Workspace', _ = 'which_key_ignore' },
    }
end

return {
    'folke/which-key.nvim',
    lazy = false,
    opts = {},
    config = config,
}
