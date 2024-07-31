return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    -- Sources
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lua",
  },

  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    luasnip.config.setup({})

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = { completeopt = "menu,menuone,noinsert" },

      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        -- ["<C-y>"] = cmp.mapping.confirm({ select = true }),

        -- Scroll the documentation window [b]ack / [f]orward
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),

        -- Manually trigger a completion from nvim-cmp.
        --  Generally you don't need this, because nvim-cmp will display
        --  completions whenever it has completion options available.
        ["<C-Space>"] = cmp.mapping.complete({}),

        -- Think of <c-l> as moving to the right of your snippet expansion.
        --  So if you have a snippet that's like:
        --  function $name($args)
        --    $body
        --  end
        --
        -- <c-l> will move you to the right of each of the expansion locations.
        -- <c-h> is similar, except moving you backwards.
        ["<C-l>"] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { "i", "s" }),
        ["<C-h>"] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { "i", "s" }),
      }),
      sources = {
        { name = "lazydev", group_index = 0 },
        { name = "luasnip", group_index = 1 },
        { name = "nvim_lsp", group_index = 1 },
        { name = "path", group_index = 2 },
        { name = "buffer", keyword_length = 2, max_item_count = 2, group_index = 2 },
      },
    })
  end,
}
