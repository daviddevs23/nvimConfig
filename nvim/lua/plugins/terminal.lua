return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        priority = 10,
        opts = {
            direction = "horizontal",
            open_mapping = [[<c-\>]],
            size = vim.api.nvim_win_get_height(0) / 4
        },
    }
}
