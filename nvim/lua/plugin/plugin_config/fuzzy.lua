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

-- Open telescope fuzzy finder
keymap("n", "<leader>ff", builtin.find_files, opts)
keymap("n", "<leader>fh", builtin.help_tags, opts)
keymap("n", "<leader>fw", builtin.live_grep, opts)
keymap("n", "<leader>fb", builtin.buffers, opts)
