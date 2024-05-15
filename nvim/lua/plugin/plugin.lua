-- Install lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

-- Lazy.nvim config
require('lazy').setup({

    -- Gruvbox B)
    { 'ellisonleao/gruvbox.nvim', priority = 1000, },

    -- LSP
    { 'neovim/nvim-lspconfig', },

    -- Snippets
    { 'L3MON4D3/LuaSnip' },

    -- Completion
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-emoji' },
    { 'saadparwaiz1/cmp_luasnip' },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        event = 'VimEnter',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
            { 'nvim-telescope/telescope-ui-select.nvim' },

            { 'nvim-tree/nvim-web-devicons',            enabled = vim.g.have_nerd_font },
        }
    },

    -- Formatting
    { 'stevearc/conform.nvim' },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },

    -- Syntax Highlighting
    { "nvim-treesitter/nvim-treesitter" },

    -- Basic Git integration
    { "lewis6991/gitsigns.nvim" }
})
