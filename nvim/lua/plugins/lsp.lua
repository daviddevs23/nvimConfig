return {
    {
        'neovim/nvim-lspconfig',
        config = function()
            local map = function(keys, func)
                vim.keymap.set('n', keys, func, { buffer = 0 })
            end

            local custom_attach = function()
                map("<leader>rr", vim.lsp.buf.rename)
                map("<leader>ca", vim.lsp.buf.code_action)
                map("gd", vim.lsp.buf.definition)
                map("gtd", vim.lsp.buf.type_definition)
                map("gr", vim.lsp.buf.references)
                map("gds", vim.lsp.buf.document_symbol)
                map("gp", vim.lsp.buf.format)
                map("K", vim.lsp.buf.hover)
            end

            local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

            -- C++
            vim.lsp.config('clangd', {
                capabilities = capabilities,
                on_attach = custom_attach,
            })
            vim.lsp.enable('clangd')

            -- Python
            vim.lsp.config('pyright', {
                capabilities = capabilities,
                on_attach = custom_attach,
            })
            vim.lsp.enable('pyright')

            -- Bash/Bash
            vim.lsp.config('bashls', {
                capabilities = capabilities,
                on_attach = custom_attach,
            })
            vim.lsp.enable('bashls')

            -- Nix
            vim.lsp.config('nixd', {
                capabilities = capabilities,
                on_attach = custom_attach,
            })
            vim.lsp.enable('nixd')

            -- HTML
            vim.lsp.config('html', {
                capabilities = capabilities,
                on_attach = custom_attach,
            })
            vim.lsp.enable('html')

            -- CSS
            vim.lsp.config('cssls', {
                capabilities = capabilities,
                on_attach = custom_attach,
            })
            vim.lsp.enable('cssls')

            -- Javascript/Typescript
            vim.lsp.config('eslint', {
                capabilities = capabilities,
                on_attach = custom_attach,
            })
            vim.lsp.enable('eslint')

            -- Cmake
            vim.lsp.config('cmake', {
                capabilities = capabilities,
                on_attach = custom_attach,
            })
            vim.lsp.enable('cmake')

            -- Lua
            vim.lsp.config('lua_ls', {
                capabilities = capabilities,
                on_attach = custom_attach,
                on_init = function(client)
                    if client.workspace_folders then
                        local path = client.workspace_folders[1].name
                        if
                            path ~= vim.fn.stdpath('config')
                            and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
                        then
                            return
                        end
                    end

                    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                        runtime = {
                            version = 'LuaJIT',
                            path = {
                                'lua/?.lua',
                                'lua/?/init.lua',
                            },
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
            })
            vim.lsp.enable('lua_ls')
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",

        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "cpp", "c", "go", "bash", "javascript", "typescript", "lua", "rust", "python" },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }
        end
    }
}
