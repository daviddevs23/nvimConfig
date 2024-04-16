-- LSP setup
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local builtin = require('telescope.builtin')

local map = function(keys, func)
    vim.keymap.set('n', keys, func, { buffer = event.buf })
end

local custom_attach = function()
    map('gd', builtin.lsp_definitions)
    map('gD', vim.lsp.buf.declaration)
    map('gr', builtin.lsp_references)
    map('<leader>D', builtin.lsp_type_definitions)
    map('<leader>ws', builtin.lsp_dynamic_workspace_symbols)
    map('<leader>rn', vim.lsp.buf.rename)
    map('<leader>ca', vim.lsp.buf.code_action)
    map('K', vim.lsp.buf.hover)
end

-- Python
require("lspconfig").pyright.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
}

-- C/C++
require("lspconfig").clangd.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
}

-- Bash/ZSH
require("lspconfig").bashls.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
}

require 'lspconfig'.lua_ls.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
            return
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                version = 'LuaJIT'
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                }
            }
        })
    end,
    settings = {
        Lua = {}
    }
}
