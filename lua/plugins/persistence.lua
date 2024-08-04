return {
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      need = 0,
    },
    keys = {
      {
        "<leader>ps",
        function()
          require("persistence").load()
        end,
      },
      {
        "<leader>pS",
        function()
          require("persistence").select()
        end,
      },
      {
        "<leader>pl",
        function()
          require("persistence").load({ last = true })
        end,
      },
      {
        "<leader>pd",
        function()
          require("persistence").stop()
        end,
      },
    },
  },
}
