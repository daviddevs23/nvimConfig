require("nvim-treesitter.configs").setup {
    ensure_installed = { "cpp", "c", "go", "bash", "javascript", "typescript", "lua", "rust", "python" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
