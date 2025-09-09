return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
            "nvim-telescope/telescope-ui-select.nvim",
        },
        opts = function()
            require("telescope").setup({
                defaults = {
                    prompt_prefix = ">> ",
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown(),
                    },
                },
            })

            pcall(require('telescope').load_extension, 'fzf')
            pcall(require('telescope').load_extension, 'ui-select')
            pcall(require('telescope').load_extension, 'trouble')

            local opts = { noremap = true, silent = true }
            local keymap = vim.keymap.set
            local builtin = require('telescope.builtin')

            local function findFileFromRoot()
                local root = string.gsub(vim.fn.system("git rev-parse --show-toplevel"), "\n", "")

                if not string.find(root, "fatal") then
                    require("telescope.builtin").find_files({ noremap = true, silent = true, cwd = root })
                else
                    require("telescope.builtin").find_files()
                end
            end

            -- Open telescope fuzzy finder
            keymap("n", "<leader>ff", findFileFromRoot, {})
            keymap("n", "<leader>fh", builtin.help_tags, opts)
            keymap("n", "<leader>fk", builtin.keymaps, opts)
            keymap("n", "<leader>fq", builtin.diagnostics, opts)
        end
    }
}
