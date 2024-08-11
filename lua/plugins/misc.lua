return {
  { "ethanholz/nvim-lastplace", opts = {} },
  { "numToStr/Comment.nvim", opts = {} },
  { "folke/todo-comments.nvim", event = "VimEnter", dependencies = { "nvim-lua/plenary.nvim" }, opts = {} },
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
  { "nmac427/guess-indent.nvim", event = "InsertEnter", opts = {} },
  { "folke/twilight.nvim", opts = {} },
  { "kylechui/nvim-surround", version = "*", opts = {}, event = "VeryLazy" },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  -- { "HiPhish/rainbow-delimiters.nvim" },
}
