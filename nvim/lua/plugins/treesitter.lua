-- Treesitter
local config = vim.defer_fn(function()
    require('nvim-treesitter.configs').setup({
        ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'bash', 'cpp', 'python', 'html', 'markdown' },
        auto_install = true,

        highlight = { enable = true },
        indent = { enable = true },

        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = '<C-Space>',
                node_incremental = '<C-Space>',
                scope_incremental = '<C-s>',
                node_decremental = '<C-,>',
            },
        },

        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ['aa'] = '@parameter.outer',
                    ['ia'] = '@parameter.inner',
                    ['af'] = '@function.outer',
                    ['if'] = '@function.inner',
                    ['ac'] = '@conditional.outer',
                    ['ic'] = '@conditional.inner',
                },
            },
            move = {
                enable = true,
                set_jumps = true,
                goto_next_start = {
                    [']m'] = '@function.outer',
                    [']]'] = '@class.outer',
                },
                goto_next_end = {
                    [']M'] = '@function.outer',
                    [']['] = '@class.outer',
                },
                goto_previous_start = {
                    ['[m'] = '@function.outer',
                    ['[['] = '@class.outer',
                },
                goto_previous_end = {
                    ['[M'] = '@function.outer',
                    ['[]'] = '@class.outer',
                },
            },
            swap = {
                enable = true,
                swap_next = { ['<leader>a'] = '@parameter.inner', },
                swap_previous = { ['<leader>A'] = '@parameter.inner', },
            },
        },

        autopairs = { enable = true, },
        autotag = { enable = true, },
    })
end, 0)

return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
        'windwp/nvim-ts-autotag',
    },
    build = ':TSUpdate',
    config = config,
}
