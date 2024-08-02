return {
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      need = 0,
    },
    keys = {
      {
        "<leader>qs",
        function()
          require("persistence").load()
        end,
      },
      {
        "<leader>qS",
        function()
          require("persistence").select()
        end,
      },
      {
        "<leader>ql",
        function()
          require("persistence").load({ last = true })
        end,
      },
      {
        "<leader>qd",
        function()
          require("persistence").stop()()
        end,
      },
    },
  },
}
