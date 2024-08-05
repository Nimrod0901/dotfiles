return {
  "williamboman/mason.nvim",
  dependencies = {},
  -- build = ":MasonInstallAll",
  config = function()
    local f = require("utils.functions")
    require("mason").setup({
      ui = {
        border = "shadow",
        zindex = 99,
      },
    })
    f.cmd("MasonInstallAll", function()
      vim.cmd("MasonUpdate")
      local ensure_installed = {
        -- "bash-language-server",
        "black",
        "clang-format",
        "clangd",
        "pyright",
        -- "dockerfile-language-server",
        -- "json-lsp",
        "lua-language-server",
        -- "prettierd",
        -- "python-lsp-server",
        "shellcheck",
        "shfmt",
        "stylua",
      }
      vim.cmd("MasonInstall " .. table.concat(ensure_installed, " "))
    end, { desc = "install all lsp tools" })
  end,
}
