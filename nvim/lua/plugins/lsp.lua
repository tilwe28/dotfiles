-- LSP
local on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<Leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<Leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Folders
    nmap('<Leader>Wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<Leader>Wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<Leader>Wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    -- Format command
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP '})
end

local config = function()
    -- Mason and Server Setup
    local mason_status_ok, mason = pcall(require, 'mason')
    if not mason_status_ok then
        return
    end
    mason.setup()

    local servers = {
        lua_ls = {
            Lua = {
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
                diagnostics = { disable = { 'missing-fields' } },
            },
        },

        clangd = {},
        pyright = {},

        html = {},
    }

    local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
    if not mason_lspconfig_status_ok then
        return
    end
    mason_lspconfig.setup({ ensure_installed = vim.tbl_keys(servers), })


    -- Lua config for nvim
    local neodev_status_ok, neodev = pcall(require, 'neodev')
    if not neodev_status_ok then
        return
    end
    neodev.setup()

    -- Integrate nvim-cmp
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
    if not cmp_nvim_lsp_status_ok then
        return
    end
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

    mason_lspconfig.setup_handlers({
        function(server_name)
            require('lspconfig')[server_name].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = servers[server_name],
                filetypes = (servers[servers] or {}).filetypes,
            })
        end,
    })
end

return {
    'neovim/nvim-lspconfig',
    lazy = false,
    dependencies = {
        -- Language Server Installer
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        -- Additional lua config
        'folke/neodev.nvim',

        -- Status notifications
        { 'j-hui/fidget.nvim', opts = {} },
    },
    config = config,
}
