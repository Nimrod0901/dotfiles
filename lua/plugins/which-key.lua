return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    defaults = {},
    spec = {
      mode = { "n", "v" },
      { "<leader>c", group = "[C]ode" },
      { "<leader>f", group = "[F]ind" },
      { "<leader>g", group = "[G]it" },
      { "<leader>s", group = "[S]earch" },
      -- { "<leader>t", group = "Neo[T]ree" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
