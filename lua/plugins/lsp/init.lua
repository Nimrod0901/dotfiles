-- lsp in mason
local mason_lsp_servers = {
  clangd = {},
  pyright = {},
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace",
        },
      },
    },
  },
  dockerls = {},
  bashls = {},
}

-- lsp not in mason
local extra_lsp_servers = {
  ccls = {},
}

local ensure_installed = vim.tbl_keys(mason_lsp_servers)

vim.list_extend(ensure_installed, {
  -- linter
  "shellcheck", -- shell
  -- formatter
  "stylua", -- lua
  "black", -- python
  "clang-format", -- cpp
  "shfmt", -- bash
})

return {
  { "WhoIsSethDaniel/mason-tool-installer.nvim", opts = { ensure_installed = ensure_installed } },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", ops = {} },
      { "williamboman/mason-lspconfig.nvim" },

      -- Useful status updates for LSP.
      { "j-hui/fidget.nvim", opts = {} },

      -- Pretty UI
      -- { "nvimdev/lspsaga.nvim", opts = {} },

      -- Better Lua LS
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            -- Load luvit types when the `vim.uv` word is found
            { path = "luvit-meta/library", words = { "vim%.uv" } },
          },
        },
      },
      { "Bilal2453/luvit-meta", lazy = true },
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
          map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
          map("gK", vim.lsp.buf.signature_help, "[H]over")
          map("gY", require("telescope.builtin").lsp_type_definitions, "[G]oto t[Y]pe definition")
          map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
          map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
          map("K", vim.lsp.buf.hover, "[H]over")

          map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
          map("<leader>cr", vim.lsp.buf.rename, "[C]ode [R]ename")
          map("<leader>cs", require("telescope.builtin").lsp_document_symbols, "[C]ode document [S]ymbols")
          map("<leader>cS", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[C]ode workspace [S]ymbols")
          map("<leader>cc", vim.lsp.codelens.run, "[C]ode [C]odelens")

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          -- local client = vim.lsp.get_client_by_id(event.data.client_id)
          -- if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
          --   local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
          --   vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
          --     buffer = event.buf,
          --     group = highlight_augroup,
          --     callback = vim.lsp.buf.document_highlight,
          --   })
          --
          --   vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
          --     buffer = event.buf,
          --     group = highlight_augroup,
          --     callback = vim.lsp.buf.clear_references,
          --   })
          --
          --   vim.api.nvim_create_autocmd("LspDetach", {
          --     group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
          --     callback = function(event2)
          --       vim.lsp.buf.clear_references()
          --       vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
          --     end,
          --   })
          -- end
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      require("mason-lspconfig").setup({
        handlers = {
          function(server_name)
            local config = mason_lsp_servers[server_name] or {}
            config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {})
            require("lspconfig")[server_name].setup(config)
          end,
        },
      })

      for server, config in pairs(extra_lsp_servers) do
        require("lspconfig")[server].setup(config)
      end
    end,
  },
}
