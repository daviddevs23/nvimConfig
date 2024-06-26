local cmp = require("cmp")

if cmp ~= nil then
    cmp.setup({
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            -- TODO: Change the autocomplete confirm key to something that isn"t the freaking new line key
            ["<C-y>"] = cmp.mapping.confirm({ select = true }),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-p>"] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = 'luasnip' },
            { name = "buffer" },
            { name = "path" },
            { name = "emoji" },
        })
    })
end
