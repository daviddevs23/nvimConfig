-- Key remaps
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Easier escaping
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)
keymap("v", "hj", "<ESC>", opts)
keymap("v", "jh", "<ESC>", opts)

-- Better tabbing
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Disable arrow keys
keymap("i", "<UP>", "", opts)
keymap("i", "<DOWN>", "", opts)
keymap("i", "<LEFT>", "", opts)
keymap("i", "<RIGHT>", "", opts)

keymap("v", "<UP>", "", opts)
keymap("v", "<DOWN>", "", opts)
keymap("v", "<LEFT>", "", opts)
keymap("v", "<RIGHT>", "", opts)

keymap("n", "<UP>", "", opts)
keymap("n", "<DOWN>", "", opts)
keymap("n", "<LEFT>", "", opts)
keymap("n", "<RIGHT>", "", opts)
