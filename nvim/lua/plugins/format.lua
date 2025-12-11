return {
    {
        "stevearc/conform.nvim",
        opts = {},
        config = function()
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*",
                callback = function(args)
                    require("conform").format({ asynce = true, lsp_fallback = true })
                end,
            })
        end
    }
}
