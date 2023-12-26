-- Which-Key
local config = function()
    local which_key_status_ok, which_key = pcall(require, 'which-key')
    if not which_key_status_ok then
        return
    end
    which_key.register {
        ['<Leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<Leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
        ['<Leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<Leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<Leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
        ['<Leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
    }
end

return {
    'folke/which-key.nvim',
    lazy = false,
    opts = {},
    config = config,
}
