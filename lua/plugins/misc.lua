return {
  { "ethanholz/nvim-lastplace", opts = {} },
  { "numToStr/Comment.nvim", opts = {} },
  { "folke/todo-comments.nvim", event = "VimEnter", dependencies = { "nvim-lua/plenary.nvim" }, opts = {} },
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
  { "nmac427/guess-indent.nvim", event = "InsertEnter", opts = {} },
  { "folke/twilight.nvim", opts = {} },
  { "kylechui/nvim-surround", version = "*", opts = {}, event = "VeryLazy" },
  -- { "HiPhish/rainbow-delimiters.nvim" },
}
