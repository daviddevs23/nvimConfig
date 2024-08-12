require('telescope').setup {
    defaults = {
        prompt_prefix = ">> "
    },
    extensions = {
        ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
        },
    },
}

pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set
local builtin = require 'telescope.builtin'

local function find_file_from_root()
    local root = string.gsub(vim.fn.system("git rev-parse --show-toplevel"), "\n", "")

    if not string.find(root, "fatal") then
        require("telescope.builtin").find_files({ noremap = true, silent = true, cwd = root })
    else
        require("telescope.builtin").find_files()
    end
end

-- Open telescope fuzzy finder
keymap("n", "<leader>ff", find_file_from_root, {})
keymap("n", "<leader>fh", builtin.help_tags, opts)
keymap("n", "<leader>sk", builtin.keymaps, opts)
