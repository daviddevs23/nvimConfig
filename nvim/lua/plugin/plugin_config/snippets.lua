-- Load friendly vscode snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- Snippet setup
local ls = require("luasnip")

-- vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<S-Tab>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-Tab>", function() ls.jump(-1) end, { silent = true })

-- Custom snippets
-- Flask template example!!
