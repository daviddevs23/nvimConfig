-- Set space as leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set some default nvim options so I don't tear my hair out
require('nvim.options')
require('nvim.keymaps')
require('plugins.plugins')
require('plugins.lsp')
require('plugins.completion')
require('plugins.navigation')
