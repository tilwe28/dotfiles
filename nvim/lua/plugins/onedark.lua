-- Colorscheme
return {
    'navarasu/onedark.nvim',
    lazy = false,
    priority = 1000,
    opts = { style = 'deep' },
    config = function(_, opts)
        local onedark_status_ok, onedark = pcall(require, 'onedark')
        if not onedark_status_ok then
            return
        end
        onedark.setup(opts)
        vim.cmd.colorscheme('onedark')
    end,
}
