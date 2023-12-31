-- CMP
local config = function()
    local cmp_status_ok, cmp = pcall(require, 'cmp')
    if not cmp_status_ok then
        return
    end

    local snip_status_ok, luasnip = pcall(require, 'luasnip')
    if not snip_status_ok then
        return
    end

    require('luasnip.loaders.from_vscode').lazy_load()
    luasnip.config.setup({})

    local kind_status_ok, lspkind = pcall(require, 'lspkind')
    if not kind_status_ok then
        return
    end

    -- Super Tab in Snippets
    local check_backspace = function()
        local col = vim.fn.col('.') - 1
        return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
    end

    cmp.setup({
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-j>'] = cmp.mapping.select_next_item(),
            ['<C-k>'] = cmp.mapping.select_prev_item(),
            ['<Down>'] = cmp.mapping.select_next_item(),
            ['<Up>'] = cmp.mapping.select_prev_item(),
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),         -- shows full completion list

            -- Close Completion Window
            ['<Esc>'] = cmp.mapping({
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            }),

            -- Accept
            ['<CR>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            }),
            ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.confirm({ select = true })
                elseif luasnip.expandable() then
                    luasnip.expand()
                elseif luasnip.expand_or_locally_jumpable() then
                    luasnip.expand_or_jump()
                elseif check_backspace() then
                    fallback()
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                    cmp.confirm()
                elseif luasnip.locally_jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { 'i', 's' }),
        }),
        sources = {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'buffer' },
            { name = 'path' },
        },
        formatting = {
            fields = { 'abbr', 'kind' },
            format = lspkind.cmp_format({
                maxwidth = 50,
                ellipsis_char = '...',
            })
        },
    })

    -- Use autopairs to add parenthesis after selecting a function or method
    local autopairs_status_ok, autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
    if not autopairs_status_ok then
        return
    end
    cmp.event:on('confirm_done', autopairs.on_confirm_done())
end

return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',

        -- Snippets
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets',

        -- Visual
        'onsails/lspkind.nvim',

        -- Autopairs
        {
            'windwp/nvim-autopairs',
            event = 'InsertEnter',
            opts = {},
        },
    },
    config = config,
}
