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

            -- C++
            require "lspconfig".clangd.setup {
                on_attach = custom_attach,
            }

            -- Python
            require "lspconfig".pyright.setup {
                on_attach = custom_attach,
            }

            -- Bash/Bash
            require "lspconfig".bashls.setup {
                on_attach = custom_attach,
            }

            -- Nix
            require "lspconfig".nixd.setup {
                on_attach = custom_attach,
            }

            -- HTML
            require "lspconfig".html.setup {
                on_attach = custom_attach,
            }

            -- CSS
            require "lspconfig".cssls.setup {
                on_attach = custom_attach,
            }

            -- Javascript/Typescript
            require "lspconfig".eslint.setup {
                on_attach = custom_attach,
            }

            -- Lua
            require "lspconfig".lua_ls.setup {
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
            }
        end
    }
}
