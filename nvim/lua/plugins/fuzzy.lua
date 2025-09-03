return {
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = function()
            local fzf = require("fzf-lua")
            local config = fzf.config
            local actions = fzf.actions
            local map = function(keys, func)
                vim.keymap.set('n', keys, func, { buffer = 0 })
            end

            local function findFileFromRoot()
                local root = string.gsub(vim.fn.system("git rev-parse --show-toplevel"), "\n", "")

                if not string.find(root, "fatal") then
                    fzf.files({ cwd = root })
                else
                    fzf.files()
                end
            end

            map("<leader>ff", findFileFromRoot)
        end
    }
}
