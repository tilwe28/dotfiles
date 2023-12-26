-- Bufferline
local config = function()
    local bufferline_status_ok, bufferline = pcall(require, 'bufferline')
    if not bufferline_status_ok then
        return
    end
    bufferline.setup({
        options = {
            mode = 'buffers',
            style_preset = bufferline.style_preset.default,
            themable = true,
            numbers = 'none',
            close_command = 'Bdelete! %d',
            right_mouse_command = 'Bdelete! %d',
            left_mouse_command = 'buffer %d',
            middle_mouse_command = 'Bdelete! %d',
            indicator_icon = '▎',
            buffer_close_icon = '󰅖',
            modified_icon = '●',
            close_icon = '',
            left_trunc_marker = '',
            right_trunc_marker = '',
            nax_name_length = 30,
            max_prefix_length = 30,
            tab_size = 21,
            diagnostics = false,
            diagnostics_update_in_insert = false,
            offsets = {
                {
                    filetype = 'NvimTree',
                    text = 'Files',
                    text_align = 'center',
                    padding = 1,
                    separator = true,
                },
            },
            show_buffer_icons = true,
            show_buffer_close_icons = true,
            show_close_icon = false,
            show_tab_indicators = true,
            persist_buffer_sort = true,
            separator_style = 'thin',
            enforce_regular_tabs = true,
            always_show_bufferline = false,
        },
    })
end

return {
    'akinsho/bufferline.nvim',
    event = 'BufReadPre',
    lazy = true,
    opts = {},
    dependencies = { 'moll/vim-bbye' },
    config = config,
}
