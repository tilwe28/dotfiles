return {
    'lukas-reineke/indent-blankline.nvim',
    lazy = false,
    main = 'ibl',

    config = function ()
        local ibl_status_ok, ibl = pcall(require, 'ibl')
        if not ibl_status_ok then
            return
        end
        ibl.setup({})
    end
}
